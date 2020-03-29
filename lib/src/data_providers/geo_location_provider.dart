import 'package:location/location.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:covid19cuba/src/utils/config.dart';

Future<http.Response> postGeo (LocationData geodata) async {
  Map otherdata = {
      'accuracy': geodata.accuracy, // Estimated horizontal accuracy of this location, radial, in meters
      'altitude': geodata.altitude, // In meters above the WGS 84 reference ellipsoid
      'speed': geodata.speed, // In meters/second
      'speedAccuracy': geodata.speedAccuracy, // In meters/second, always 0 on iOS
      'heading': geodata.heading, //Heading is the horizontal direction of travel of this device, in degrees
      'time': geodata.time //timestamp of the LocationData
  };
  Map data = {
    'lat': geodata.latitude,
    'lon': geodata.longitude,
    'data': otherdata
  };
  //encode Map to JSON
  var body = json.encode(data);
  var response = null;
  try {
    response = await http.post(remote_geo_server,
      headers: {"Content-Type": "application/json"},
      body: body
    );
  } catch (e) {
    print('Cant send geodata to server');
    print(e);
    return null;
  }
  print("${response.statusCode}");
  print("${response.body}");
  return response;
}

Future<LocationData> getLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData=null;
    var location=Location();

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return _locationData;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return _locationData;
      }
    }
    _locationData = await location.getLocation();
    return _locationData;
}