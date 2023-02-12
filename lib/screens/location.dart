import 'package:flutter/material.dart';
import 'package:weather_app/widgets/location_page_content.dart';

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
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff1E1E1E), Color(0xff1e3e1e)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: LocationPageContent(
          location: widget.locationWeather,
        ),
      ),
    );
  }
}
