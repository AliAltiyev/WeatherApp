import 'package:geolocator/geolocator.dart';

class UserLocation {
  late double lan;
  late double long;

  //Get Location
  Future<void> getUserLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.whileInUse) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      lan = position.latitude;
      long = position.longitude;
    }
  }
}
