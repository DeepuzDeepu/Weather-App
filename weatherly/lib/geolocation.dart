import 'package:geolocator/geolocator.dart';

class location {
  double? latitude;
  double? longitude;

  location({this.latitude, this.longitude});

  static Future<location> getCurrentlocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);

    return location(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }
}