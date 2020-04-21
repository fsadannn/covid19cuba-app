import 'package:covid19cuba/src/utils/constants.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/models/models.dart';

part 'data_model.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class DataModel {
  @JsonKey(name: 'all')
  CubaModel all;

  @JsonKey(name: 'provinces')
  Map<String, ProvincesModel> provinces;

  DataModel();

  MunicipalitiesModel getMunicipality(String code) {
    if (code == '40.01') {
      return provinces['ijv'].municipalities[code];
    }
    var prov = code.split('.')[0];
    var abbr = Constants.provincesCodes[prov];
    return provinces[abbr].municipalities[code];
  }

  static String prettyCountry(String country) {
    var dict = <String, String>{
      'Vietnam': 'Vietnam',
      'Austria': 'Austria',
      'Cambodia': 'Camboya',
      'Kazakhstan': 'Kazajstán',
      "Cote d'Ivoire": 'Costa de Marfil',
      'Spain': 'España',
      'Serbia': 'Serbia',
      'Ethiopia': 'Etiopía',
      'Brazil': 'Brasil',
      'Pakistan': 'Pakistán',
      'Panama': 'Panamá',
      'Syria': 'Siria',
      'France': 'Francia',
      'Germany': 'Alemania',
      'Montenegro': 'Montenegro',
      'Switzerland': 'Suiza',
      'Paraguay': 'Paraguay',
      'Holy See': 'Santa Sede',
      'Nepal': 'Nepal',
      'Norway': 'Noruega',
      'Afghanistan': 'Afganistán',
      'Djibouti': 'Yitubi',
      'Ireland': 'Irlanda',
      'United Arab Emirates': 'Emiratos Árabes Unidos',
      'Israel': 'Israel',
      'Bulgaria': 'Bulgaria',
      'Korea, South': 'Corea del Sur',
      'Cyprus': 'Chipre',
      'Peru': 'Perú',
      'Azerbaijan': 'Azerbaiyán',
      'Philippines': 'Filipinas',
      'Bahamas': 'Bahamas',
      'India': 'India',
      //'MS Zaandam': 'MS Zaandam',
      'Canada': 'Canadá',
      'Rwanda': 'Ruanda',
      'Cuba': 'Cuba',
      'Thailand': 'Tailandia',
      'Brunei': 'Brunéi',
      'El Salvador': 'El Salvador',
      'North Macedonia': 'Macedonia del Norte',
      'Saint Vincent and the Grenadines': 'San Vicente y las Granadinas',
      'Jamaica': 'Jamaica',
      'Greece': 'Grecia',
      'Bolivia': 'Bolivia',
      'Dominica': 'Dominica',
      'Togo': 'Togo',
      'Mauritius': 'Mauricio',
      'Russia': 'Rusia',
      'Lebanon': 'Líbano',
      'Zimbabwe': 'Zimbabue',
      'Nigeria': 'Nigeria',
      'Finland': 'Finlandia',
      'Burma': 'Birmania',
      'Iraq': 'Irak',
      'United Kingdom': 'Reino Unido',
      'Tanzania': 'Tanzania',
      'Uruguay': 'Uruguay',
      'South Africa': 'Sudáfrica',
      'Somalia': 'Somalia',
      'Algeria': 'Argelia',
      'Benin': 'Benín',
      'Niger': 'Níger',
      'West Bank and Gaza': 'Cisjordania',
      'Uganda': 'Uganda',
      'San Marino': 'San Marino',
      'Liberia': 'Liberia',
      'Iran': 'Irán',
      'Mexico': 'México',
      'Honduras': 'Honduras',
      'Burkina Faso': 'Burkina Faso',
      'Australia': 'Australia',
      'Chile': 'Chile',
      'Haiti': 'Haití',
      'Turkey': 'Turquía',
      'Madagascar': 'Madagascar',
      'Saint Lucia': 'Santa Lucía',
      'Papua New Guinea': 'Papúa Nueva Guinea',
      'Central African Republic': 'República Centroafricana',
      'Eritrea': 'Eritrea',
      'Lithuania': 'Lituania',
      'Kyrgyzstan': 'Kirguistán',
      'Andorra': 'Andorra',
      'Laos': 'Laos',
      'Mali': 'Mali',
      'Guinea': 'Guinea',
      'Luxembourg': 'Luxemburgo',
      'Gambia': 'Gambia',
      'Mongolia': 'Mongolia',
      'Costa Rica': 'Costa Rica',
      'Trinidad and Tobago': 'Trinidad y Tobago',
      'Mauritania': 'Mauritania',
      'Antigua and Barbuda': 'Antigua y Barbuda',
      'Libya': 'Libia',
      'Zambia': 'Zambia',
      'Timor-Leste': 'Timor-Leste',
      'Guyana': 'Guayana',
      'Tunisia': 'Túnez',
      'Japan': 'Japón',
      'Liechtenstein': 'Liechtenstein',
      'Saint Kitts and Nevis': 'San Cristóbal y Nieves',
      'Senegal': 'Senegal',
      'Hungary': 'Hungría',
      'Moldova': 'Moldavia',
      'Qatar': 'Katar',
      'US': 'Estados Unidos',
      'Belarus': 'Bielorrusia',
      'Chad': 'Chad',
      'Malaysia': 'Malasia',
      'Romania': 'Rumania',
      'Argentina': 'Argentina',
      'Belize': 'Belice',
      'Angola': 'Angola',
      'Sweden': 'Suecia',
      'China': 'China',
      'Jordan': 'Jordán',
      'Italy': 'Italia',
      'Latvia': 'Letonia',
      'Seychelles': 'Seychelles',
      'Ghana': 'Ghana',
      'Colombia': 'Colombia',
      'Albania': 'Albania',
      'Saudi Arabia': 'Arabia Saudita',
      'Estonia': 'Estonia',
      'Monaco': 'Mónaco',
      'Ukraine': 'Ucrania',
      'Uzbekistan': 'Uzbekistán',
      'Maldives': 'Maldivas',
      'Morocco': 'Marruecos',
      'Portugal': 'Portugal',
      'Kenya': 'Kenia',
      'Guatemala': 'Guatemala',
      'Gabon': 'Gabón',
      'Belgium': 'Bélgica',
      'Iceland': 'Islandia',
      'Cabo Verde': 'Cabo Verde',
      'Mozambique': 'Mozambique',
      'Indonesia': 'Indonesia',
      'Egypt': 'Egipto',
      'Taiwan*': 'Taiwán *',
      'Netherlands': 'Países Bajos',
      'Slovakia': 'Eslovaquia',
      'Bosnia and Herzegovina': 'Bosnia y Herzegovina',
      'Cameroon': 'Camerún',
      'Venezuela': 'Venezuela',
      'Kuwait': 'Kuwait',
      'Malta': 'Malta',
      'Nicaragua': 'Nicaragua',
      'Congo (Kinshasa)': 'Congo (Kinshasa)',
      'Singapore': 'Singapur',
      'Bhutan': 'Bután',
      'Bangladesh': 'Bangladesh',
      'Ecuador': 'Ecuador',
      'Georgia': 'Georgia',
      'Namibia': 'Namibia',
      'Denmark': 'Dinamarca',
      'Poland': 'Polonia',
      'Suriname': 'Surinam',
      'Slovenia': 'Eslovenia',
      'Congo (Brazzaville)': 'Congo (Brazzaville)',
      'Guinea-Bissau': 'Guinea-Bissau',
      'Dominican Republic': 'República Dominicana',
      //'Diamond Princess': 'Princesa del Diamante',
      'Grenada': 'Granada',
      'Barbados': 'Barbados',
      'New Zealand': 'Nueva Zelanda',
      'Eswatini': 'Eswatini',
      'Czechia': 'Chequia',
      'Kosovo': 'Kosovo',
      'Sudan': 'Sudán',
      'Armenia': 'Armenia',
      'Bahrain': 'Bahrein',
      'Sri Lanka': 'Sri Lanka',
      'Equatorial Guinea': 'Guinea Ecuatorial',
      'Croatia': 'Croacia',
      'Oman': 'Omán',
      'Fiji': 'Fiyi',
    };
    return dict.containsKey(country) ? dict[country] : country;
  }

  static Map<String, String> countries() {
    var dict = <String, String>{
      "AD": "Andorra",
      "AE": "United Arab Emirates",
      "AF": "Afghanistan",
      "AG": "Antigua and Barbuda",
      // "AI": "Anguilla",
      "AL": "Albania",
      "AM": "Armenia",
      // "AN": "Netherlands Antilles",
      "AO": "Angola",
      // "AQ": "Antarctica",
      "AR": "Argentina",
      // "AS": "American Samoa",
      "AT": "Austria",
      "AU": "Australia",
      // "AW": "Aruba",
      // "AX": "\u00c5land Islands",
      "AZ": "Azerbaijan",
      "BA": "Bosnia and Herzegovina",
      "BB": "Barbados",
      "BD": "Bangladesh",
      "BE": "Belgium",
      "BF": "Burkina Faso",
      "BG": "Bulgaria",
      "BH": "Bahrain",
      // "BI": "Burundi",
      "BJ": "Benin",
      // "BL": "Saint Barthélemy",
      // "BM": "Bermuda",
      "BN": "Brunéi", //"Brunei Darussalam",
      "BO": "Bolivia", //"Bolivia, Plurinational State of",
      // "BQ": "Caribbean Netherlands",
      "BR": "Brazil",
      "BS": "Bahamas",
      "BT": "Bhutan",
      // "BV": "Bouvet Island",
      // "BW": "Botswana",
      "BY": "Belarus",
      "BZ": "Belize",
      "CA": "Canada",
      "UX": "Camboya",
      // "CC": "Cocos (Keeling) Islands",
      "CD": "Congo (Kinshasa)", //"Congo, the Democratic Republic of the",
      "CF": "Central African Republic",
      "CG": "Congo (Brazzaville)", //"Congo",
      "CH": "Switzerland",
      "CI": "Cote d'Ivoire",
      // "CK": "Cook Islands",
      "CL": "Chile",
      "CM": "Cameroon",
      "CN": "China",
      "CO": "Colombia",
      "CR": "Costa Rica",
      // "CU": "Cuba",
      "CV": "Cabo Verde", //"Cape Verde",
      // "CW": "Cura\u00e7ao",
      // "CX": "Christmas Island",
      "CY": "Cyprus",
      "CZ": "Czechia", //"Czech Republic",
      "DE": "Germany",
      "DJ": "Djibouti",
      "DK": "Denmark",
      "DM": "Dominica",
      "DO": "Dominican Republic",
      "DZ": "Algeria",
      "EC": "Ecuador",
      "EE": "Estonia",
      "EG": "Egypt",
      // "EH": "Western Sahara",
      "ER": "Eritrea",
      "ES": "Spain",
      "ET": "Ethiopia",
      // "EU": "Europe",
      "FI": "Finland",
      "FJ": "Fiji",
      // "FK": "Falkland Islands (Malvinas)",
      // "FM": "Micronesia, Federated States of",
      // "FO": "Faroe Islands",
      "FR": "France",
      "GA": "Gabon",
      // "GB-ENG": "England",
      "GB-NIR": "Ireland",
      // "GB-SCT": "Scotland",
      // "GB-WLS": "Wales",
      "GB": "United Kingdom",
      "GD": "Grenada",
      "GE": "Georgia",
      // "GF": "French Guiana",
      // "GG": "Guernsey",
      "GH": "Ghana",
      // "GI": "Gibraltar",
      // "GL": "Greenland",
      "GM": "Gambia",
      "GN": "Guinea",
      // "GP": "Guadeloupe",
      "GQ": "Equatorial Guinea",
      "GR": "Greece",
      // "GS": "South Georgia and the South Sandwich Islands",
      "GT": "Guatemala",
      // "GU": "Guam",
      "GW": "Guinea-Bissau",
      "GY": "Guyana",
      // "HK": "Hong Kong",
      // "HM": "Heard Island and McDonald Islands",
      "HN": "Honduras",
      "HR": "Croatia",
      "HT": "Haiti",
      "HU": "Hungary",
      "ID": "Indonesia",
      // "IE": "Ireland",
      "IL": "Israel",
      // "IM": "Isle of Man",
      "IN": "India",
      // "IO": "British Indian Ocean Territory",
      "IQ": "Iraq",
      "IR": "Irán", //"Iran, Islamic Republic of",
      "IS": "Iceland",
      "IT": "Italy",
      // "JE": "Jersey",
      "JM": "Jamaica",
      "JO": "Jordan",
      "JP": "Japan",
      "KE": "Kenya",
      "KG": "Kyrgyzstan",
      // "KH": "Cambodia",
      // "KI": "Kiribati",
      // "KM": "Comoros",
      "KN": "Saint Kitts and Nevis",
      // "KP": "Korea, Democratic People's Republic of",
      "KR": "Korea, South", //"Korea, Republic of",
      "KW": "Kuwait",
      // "KY": "Cayman Islands",
      "KZ": "Kazakhstan",
      "LA": "Laos", //"Lao People's Democratic Republic",
      "LB": "Lebanon",
      "LC": "Saint Lucia",
      "LI": "Liechtenstein",
      "LK": "Sri Lanka",
      "LR": "Liberia",
      // "LS": "Lesotho",
      "LT": "Lithuania",
      "LU": "Luxembourg",
      "LV": "Latvia",
      "LY": "Libya",
      "MA": "Morocco",
      "MC": "Monaco",
      "MD": "Moldova", //"Moldova, Republic of",
      "ME": "Montenegro",
      // "MF": "Saint Martin",
      "MG": "Madagascar",
      // "MH": "Marshall Islands",
      "MK": "North Macedonia", //"Macedonia, the former Yugoslav Republic of",
      "ML": "Mali",
      "MM": "Burma", //"Myanmar",
      "MN": "Mongolia",
      // "MO": "Macao",
      // "MP": "Northern Mariana Islands",
      // "MQ": "Martinique",
      "MR": "Mauritania",
      // "MS": "Montserrat",
      "MT": "Malta",
      "MU": "Mauritius",
      "MV": "Maldives",
      // "MW": "Malawi",
      "MX": "Mexico",
      "MY": "Malaysia",
      "MZ": "Mozambique",
      "NA": "Namibia",
      // "NC": "New Caledonia",
      "NE": "Niger",
      // "NF": "Norfolk Island",
      "NG": "Nigeria",
      "NI": "Nicaragua",
      "NL": "Netherlands",
      "NO": "Norway",
      "NP": "Nepal",
      // "NR": "Nauru",
      // "NU": "Niue",
      "NZ": "New Zealand",
      "OM": "Oman",
      "PA": "Panama",
      "PE": "Peru",
      // "PF": "French Polynesia",
      "PG": "Papua New Guinea",
      "PH": "Philippines",
      "PK": "Pakistan",
      "PL": "Poland",
      // "PM": "Saint Pierre and Miquelon",
      // "PN": "Pitcairn",
      // "PR": "Puerto Rico",
      "PS": "West Bank and Gaza",//"Palestine",
      "PT": "Portugal",
      // "PW": "Palau",
      "PY": "Paraguay",
      "QA": "Qatar",
      // "RE": "Réunion",
      "RO": "Romania",
      "RS": "Serbia",
      "RU": "Russia",
      "RW": "Rwanda",
      "SA": "Saudi Arabia",
      // "SB": "Solomon Islands",
      "SC": "Seychelles",
      "SD": "Sudan",
      "SE": "Sweden",
      "SG": "Singapore",
      // "SH": "Saint Helena, Ascension and Tristan da Cunha",
      "SI": "Slovenia",
      // "SJ": "Svalbard and Jan Mayen Islands",
      "SK": "Slovakia",
      // "SL": "Sierra Leone",
      "SM": "San Marino",
      "SN": "Senegal",
      "SO": "Somalia",
      "SR": "Suriname",
      // "SS": "South Sudan",
      // "ST": "Sao Tome and Principe",
      "SV": "El Salvador",
      // "SX": "Sint Maarten (Dutch part)",
      "SY": "Syria",
      "SZ": "Eswatini", //"Swaziland",
      // "TC": "Turks and Caicos Islands",
      "TD": "Chad",
      // "TF": "French Southern Territories",
      "TG": "Togo",
      "TH": "Thailand",
      // "TJ": "Tajikistan",
      // "TK": "Tokelau",
      "TL": "Timor-Leste",
      // "TM": "Turkmenistan",
      "TN": "Tunisia",
      // "TO": "Tonga",
      "TR": "Turkey",
      "TT": "Trinidad and Tobago",
      // "TV": "Tuvalu",
      "TW": "Taiwan",
      "TZ": "Tanzania", //"Tanzania, United Republic of",
      "UA": "Ukraine",
      "UG": "Uganda",
      // "UM": "US Minor Outlying Islands",
      "US": "US", //"United States",
      "UY": "Uruguay",
      "UZ": "Uzbekistan",
      "VA": "Holy See",
      "VC": "Saint Vincent and the Grenadines",
      "VE": "Venezuela", //"Venezuela, Bolivarian Republic of",
      // "VG": "Virgin Islands, British",
      // "VI": "Virgin Islands, U.S.",
      "VN": "Viet Nam",
      // "VU": "Vanuatu",
      // "WF": "Wallis and Futuna Islands",
      "XK": "Kosovo",
      // "WS": "Samoa",
      // "YE": "Yemen",
      // "YT": "Mayotte",
      "ZA": "South Africa",
      "ZM": "Zambia",
      "ZW": "Zimbabwe"
    };
    return dict;
  }

  static String countryCode(String country) {
    var dict = countries();
    var countryCode =
        dict.keys.firstWhere((k) => dict[k] == country, orElse: () => null);
    return countryCode;
  }

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}