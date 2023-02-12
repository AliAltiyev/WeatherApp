import 'package:weather_app/service/network.dart';
import 'package:weather_app/utilities/constants.dart';

import 'location.dart';

class Weather {
  Future<dynamic> getUserLocation() async {
    UserLocation location = UserLocation();
    await location.getUserLocation();

    Network network = Network(
        'http://api.weatherstack.com/current?access_key=$apiKey&query=${location.lan},${location.long}');
    return await network.getData();
  }
}
