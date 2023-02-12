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

  getData(location.lantitute, location.longitude);
}

getData(double? lat, double? lon) async {
  const apiKey = '027bf4ee480d431a24bc92dd3438f942';

  http.Response response = await http.get(Uri.parse(
      'http://api.weatherstack.com/current?access_key=$apiKey&query=Minsk'));

  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print(response.statusCode);
  }
}
