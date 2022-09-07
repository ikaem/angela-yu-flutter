import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  // Location({required this.longitude, required this.latitude});

  Future<void> getCurrentPosition() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print("this is error: $e");
    }
  }
}
