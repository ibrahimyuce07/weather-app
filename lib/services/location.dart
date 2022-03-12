import 'package:geolocator/geolocator.dart';

class LocationService {

   double latitude = 0.0;
   double longitude = 0.0;

  Future<void> getCurrentLocation() async{
    try {
      print("Getting current location...");
      var now = DateTime.now();
      var startTime = now.millisecondsSinceEpoch;
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
      var endTime = DateTime.now().millisecondsSinceEpoch;
      print("Time taken to get current location: ${(endTime - startTime) / 1000} seconds");
      print("Current location is ${position.latitude}, ${position.longitude}");
      latitude = position.latitude;
      longitude = position.longitude;
    } on Exception catch (e) {
      print(e);
    }
  }
}