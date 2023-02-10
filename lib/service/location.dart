import 'package:geolocator/geolocator.dart';

class Location {
  double? longitude;
  double? lantitute;

  Future<void> getLocation() async {
    //Ask Permission
    LocationPermission permissions = await Geolocator.requestPermission();
    //Get Location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    lantitute = position.latitude;
    longitude = position.longitude;
  }
}
