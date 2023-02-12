import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/screens/location.dart';
import 'package:weather_app/service/weather.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    getUserLocation();
  }

  getUserLocation() async {
    Weather weather = Weather();
    var data = await weather.getUserLocation();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LocationScreen(locationWeather: data,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Stack(
        children: [
          Image.asset(
            'assets/splash.png',
            fit: BoxFit.fill,
          ),
          Center(
            child: SpinKitFadingCircle(
              color: Colors.deepPurple,
            ),
          )
        ],
      ),
    ));
  }
}
