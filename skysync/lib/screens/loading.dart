// ignore_for_file: unused_import, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:skysync/function/location.dart';
import 'package:http/http.dart';
import 'package:skysync/function/weathermap.dart';

const api = ' aaee36e539a3634b5a211876369ca3d1';

class Loadingscreen extends StatefulWidget {
  const Loadingscreen({super.key});

  @override
  State<Loadingscreen> createState() => _LoadingscreenState();
}

class _LoadingscreenState extends State<Loadingscreen> {
  double? latitude;
  double? longtide;
  @override
  void initState() {
    super.initState();
    getlocationData();
  }

  // void getWeatherdata() async {
  //   Response response = await get(Uri.parse(
  //       "https://api.openweathermap.org/data/2.5/weather?lat=33.8&lon=122.0&appid=aaee36e539a3634b5a211876369ca3d1"));
  //   var jsondata = response.body;
  //   print(jsondata);
  // }

  void getlocationData() async {
    Networking networking = Networking(
        Url:
            'https://api.openweathermap.org/data/2.5/weather?lat=33.8&lon=122.0&appid=aaee36e539a3634b5a211876369ca3d1');
    Location location = Location();
    var location1 = await location.getlocation();
    print(location1);
    var weatherdata = await networking.getweatherdata();
    print(weatherdata);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
