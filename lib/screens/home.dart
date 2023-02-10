import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/service/location.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // @override
  // void initState() {
  //   super.initState();
  //   _getUserLocation();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () => _getUserLocation(), child: Text('Fetch data')),
      ),
    );
  }
}

_getUserLocation() async {
  Location location = Location();
  await location.getLocation();
  debugPrint(location.longitude.toString());
  debugPrint(location.lantitute.toString());

  getData(location.lantitute, location.lantitute);
}

getData(double? lat, double? lon) async {
  const apiKey = '465df165e7c9d49afd54891fd428ce6c';

  var future = await http.get(Uri.parse(
      'http://api.openweathermap.org/data/3.0/weather?q=minsk&appid=$apiKey'));
  print(future.body);
}
