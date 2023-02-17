import 'package:flutter/material.dart';

const apiKey = '027bf4ee480d431a24bc92dd3438f942';

const kAppBackgroundGradientColor = LinearGradient(
    colors: [Color(0xff1E1E1E), Color(0xff1e1e5e)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);

const kCitySearchTextFieldDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    hintText: 'Enter city',
    hintStyle: TextStyle(color: Colors.black));