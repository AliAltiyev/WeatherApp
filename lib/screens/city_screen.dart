import 'package:flutter/material.dart';
import 'package:weather_app/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Search"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          decoration: BoxDecoration(gradient: kAppBackgroundGradientColor),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                child: TextField(
                  onChanged: (String value) {
  debugPrint(value);
                  },
                  decoration: kCitySearchTextFieldDecoration,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 40,
                width: 200,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('Search')),
              )
            ],
          ),
        ));
  }
}
