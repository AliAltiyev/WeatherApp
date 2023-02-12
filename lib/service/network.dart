import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/screens/location.dart';

import '../utilities/constants.dart';

abstract class Network {
  static Future getData(double? lat, double? lon) async {
    http.Response response = await http.get(Uri.parse(
        'http://api.weatherstack.com/current?access_key=$apiKey&query=$lat,$lon'));

    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
