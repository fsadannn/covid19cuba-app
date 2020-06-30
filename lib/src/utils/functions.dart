// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:developer';

import 'package:covid19cuba/src/models/charts/data.dart';
import 'package:covid19cuba/src/models/contact/contact.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:hive/hive.dart';
import 'package:package_info/package_info.dart';
import 'package:preferences/preference_service.dart';
import 'package:url_launcher/url_launcher.dart';

int getInt(dynamic value) {
  return value is String ? int.parse(value) : value;
}

DateTime dateTimeFromJson(String dateTime) {
  if (dateTime == null || dateTime == '') {
    return null;
  }
  var split = dateTime.split('/');
  if (split.length <= 2) {
    var month = int.parse(split[0]);
    var day = int.parse(split[1]);
    return DateTime(0, month, day);
  }
  var year = int.parse(split[0]);
  var month = int.parse(split[1]);
  var day = int.parse(split[2]);
  return DateTime(year, month, day);
}

String dateTimeToJson(DateTime dateTime) {
  if (dateTime == null) {
    return null;
  }
  if (dateTime.year == 0) {
    return '${dateTime.month}/${dateTime.day}';
  }
  return '${dateTime.year}/${dateTime.month}/${dateTime.day}';
}

List<DateTime> dateTimeListFromJson(List<dynamic> x) {
  var result = List<DateTime>();
  for (var i in x) {
    result.add(dateTimeFromJson(i as String));
  }
  return result;
}

List<dynamic> dateTimeListToJson(List<DateTime> x) {
  var result = List<String>();
  for (var i in x) {
    result.add(dateTimeToJson(i));
  }
  return result;
}

extension DateTimeToString on DateTime {
  String toStr() {
    return dateTimeToJson(this);
  }

  String toStrShort() {
    return '${this.day}/${this.month}';
  }

  String toStrPlus({time: false}) {
    var months = [
      'enero',
      'febrero',
      'marzo',
      'abril',
      'mayo',
      'junio',
      'agosto',
      'septiembre',
      'octubre',
      'noviembre',
      'diciembre',
    ];
    if (!time) {
      return '${this.day} de ${months[this.month - 1]} del ${this.year}';
    }
    return '${this.hour % 12 < 10 ? '0' : ''}${this.hour % 12}:${this.minute < 10 ? '0' : ''}${this.minute} ${this.hour < 12 ? 'AM' : 'PM'} del ${this.day} de ${months[this.month - 1]} del ${this.year}';
  }
}

void getUrl(url) async {
  if (await canLaunch(url)) {
    launch(url);
  } else {
    log("Url $url resolve failed");
    //throw InvalidSourceException("No se ha podido obtener la url");
  }
}

int getDayFromCache() {
  var data = PrefService.getString(Constants.prefData);
  if (data != null) {
    var dta = Data.fromJson(jsonDecode(data));
    return dta.all.evolutionOfCasesByDays.accumulated.values.length;
  }
  return -1;
}

List<Province> getProvinceList() {
  List<Province> provinceList = new List();
  final provinceNames = {
    'Pinar del Río': ['48-724640', '48-724639'],
    'Artemisa': ['47-367157', '47-366503', '47-367491'],
    'La Habana': ['78-302524', '78-302521', '78-302116'],
    'Mayabeque': ['47-867533', '47-848543'],
    'Matanzas': ['45-243725', '45-262417'],
    'Villa Clara': ['42-215057', '42-223936'],
    'Cienfuegos': ['43-515873', '43-519512', '43-517737'],
    'Sancti Spíritus': ['41-336137'],
    'Ciego de Ávila': ['33-223192', '33202748'],
    'Camagüey': ['32-297118', '32-256218'],
    'Las Tunas': ['31-349244', '31-346179'],
    'Holguín': ['24-473036', '24-453766', '24 -429557'],
    'Granma': ['23-411012', '23-423017', '23-423009'],
    'Santiago de Cuba': ['22-656455 ext 192', '22-651573', '22-651542'],
    'Guantánamo': ['21-326890', '21-326705'],
    'Isla de la Juventud': ['46-324587', '46-324090 ext 104']
  };
  provinceNames.forEach((name, phonesList) {
    provinceList.add(Province(
      name: name,
      phoneNumbers: phonesList,
    ));
  });
  return provinceList;
}

Future<String> getSharedContent() async {
  var packageInfo = await PackageInfo.fromPlatform();
  var apklisUrl =
      'https://archive.apklis.cu/application/apk/club.postdata.covid19cuba-v${packageInfo.buildNumber}.apk';
  var gitHubUrl =
      'https://github.com/covid19cuba/covid19cuba-app/releases/download/v${packageInfo.version}/app.apk';
  var sharedContent = """Covid19 Cuba Data

Proyecto para conocer los reportes diarios, estadísticas, etc. respecto a la Covid-19 en Cuba.

Aplicación:
- Apklis: $apklisUrl
- GitHub: $gitHubUrl

Sitio Web: https://covid19cubadata.github.io

Replicas del Sitio Web:
- http://www.cusobu.nat.cu/covid cortesía de CUSOBU
- http://covid19.frcuba.cu cortesía de la Federación de Radioaficionados de Cuba
- http://covidcuba.swlx.info cortesía del Proyecto SWL-X
- http://covid19.jovenclub.cu cortesía de Joven Club

Bot de Telegram: https://t.me/covid19cubadata_bot

Colaboradores:
- CUSOBU: https://www.cusobu.nat.cu
- Proyecto SWL-X: https://www.swlx.info
- Daxslab: https://www.daxslab.com
- Unión de Informáticos de Cuba: https://www.uic.cu
- Universidad de Oriente: https://www.uo.edu.cu
- Universidad de La Habana: http://www.uh.cu

Agradecimientos: El equipo de desarrollo de Covid19 Cuba Data agradece a todos los que de una forma u otra ayudan a combatir la pandemia de la Covid-19, en especial a los que arriesgan su vida luchando en primera línea.

Autores:
- MatCom: http://www.matcom.uh.cu
- Postdata.club: https://www.postdata.club
- Juventud Técnica: https://medium.com/juventud-técnica

Copyright 2020 ©️""";
  return sharedContent;
}

List<Contact> getContactsList(Box box) {
  var contacts = List<Contact>();
  for (var i = 0; i < box.length; ++i) {
    var json = box.getAt(i);
    var contact = Contact.fromJson(jsonDecode(json));
    contact.index = i;
    contacts.add(contact);
  }
  contacts.sort((a, b) {
    var cmpName = a.name.compareTo(b.name);
    var cmpDate = a.date.compareTo(b.date);
    var cmpPlace = a.name.compareTo(b.name);
    return cmpDate == 0 ? (cmpName == 0 ? cmpPlace : cmpName) : cmpDate;
  });
  return contacts;
}

bool checkDoNotDisturbTime(){
  int startHour = PrefService.getInt(Constants.prefDoNotDisturbTimeStartHour) ?? 21;
  int endHour = PrefService.getInt(Constants.prefDoNotDisturbTimeEndHour) ?? 9;
  int startMinutes = PrefService.getInt(Constants.prefDoNotDisturbTimeStartMinutes) ?? 30;
  int endMinutes = PrefService.getInt(Constants.prefDoNotDisturbTimeEndMinutes) ?? 30;

  var time = DateTime.now();

  int hour = time.hour;
  int minutes = time.minute;

  if(hour == startHour){
    return minutes >= startMinutes;
  }
  else if(hour == endHour){
    return minutes <= endMinutes;
  }
  else{
    return startHour < endHour ? (hour > startHour) && (hour < endHour) : (hour < startHour) || (hour > endHour);
  }
}


