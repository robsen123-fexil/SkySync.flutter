// ignore_for_file: unused_import, unused_local_variable

import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future getlocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    latitude=position.latitude;
    longitude=position.longitude;
    return position;
  }
}
