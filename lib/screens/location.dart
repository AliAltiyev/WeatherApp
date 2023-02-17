import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/widgets/location_page_content.dart';

import '../utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;

  const LocationScreen({Key? key, required this.locationWeather})
      : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: kAppBackgroundGradientColor),
          child: widget.locationWeather == null
              ? const SpinKitFadingCircle(
                  size: 40,
                  color: Colors.deepPurple,
                )
              : LocationPageContent(
                  location: widget.locationWeather,
                )),
    );
  }
}
