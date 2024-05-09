// ignore_for_file: unused_import, unused_local_variable, avoid_print, prefer_const_constructors, use_build_context_synchronously, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:skysync/function/location.dart';
import 'package:http/http.dart';
import 'package:skysync/function/weathermap.dart';
import 'package:skysync/screens/resultpage.dart';

const apikey = 'aaee36e539a3634b5a211876369ca3d1';

class Loadingscreen extends StatefulWidget {
  const Loadingscreen({super.key});

  @override
  State<Loadingscreen> createState() => _LoadingscreenState();
}

class _LoadingscreenState extends State<Loadingscreen> {
  double? latitude;
  double? longtide;
  var weatherdata;
  @override
  void initState() {
    super.initState();
    getlocationData();
  }

  void getlocationData() async {
    Location location = Location();
    await location.getlocation();

    print(latitude);
    print(longtide);

    Networking networking = Networking(
        Url:
            'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');
    var weatherdata = await networking.getweatherdata();
    
    print(weatherdata);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResultPage(weatherdata: weatherdata)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          body: SpinKitThreeBounce(
            color: Colors.white,
            size: 40,
          ),
        ));
  }
}
