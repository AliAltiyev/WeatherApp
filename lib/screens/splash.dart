import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/screens/location.dart';

import '../service/network.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    _getUserLocationData();
  }

  _getUserLocationData() async {
    double? longitude;
    double? lantitute;

    //Ask Permission
    await Geolocator.requestPermission();
    //Get Location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);

    lantitute = position.latitude;
    longitude = position.longitude;
    await Network.getData(lantitute, longitude);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LocationScreen()));
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
