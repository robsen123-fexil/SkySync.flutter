// ignore_for_file: prefer_const_constructors, unnecessary_import, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_import, unused_local_variable, prefer_typing_uninitialized_variables, non_constant_identifier_names, avoid_print, avoid_init_to_null, unnecessary_null_comparison
import 'package:skysync/screens/search.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:skysync/function/weatherstatus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:skysync/screens/loading.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key, this.weatherdata});

  final weatherdata;
  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  WeatherModel weathermodel = WeatherModel();

  late int tempreture;
  double? feels;
  int? maximum;
  int? minimum;
  int? humudity;
  int? pressure;
  int? visiblity;
  double? speed;
  String? cityname;
  String? description;
  String? weathericon;
  String? image;
  late int cond;
  @override
  void initState() {
    super.initState();
    Updateui(widget.weatherdata);
  }

  void Updateui(dynamic weatherdata) {
    if (weatherdata == null) {
      print("Weather data is null. Handling null weather data...");
      // Handle null weather data
      tempreture = 0;
      feels = 0;
      maximum = 0;
      minimum = 0;
      humudity = 0;
      visiblity = 0;
      speed = 0;
      description = "Check your connection";
      pressure = 0;
      cond = 0;
      weathericon = "null";
      image = "null";
      return; // Exit the method if weatherdata is null
    }

    // Populate data from weatherdata
    tempreture = jsonDecode(weatherdata)['main']['temp'].toInt();
    feels = jsonDecode(weatherdata)['main']['feels_like'];
    maximum = jsonDecode(weatherdata)['main']['temp_max'].toInt();
    minimum = jsonDecode(weatherdata)['main']['temp_min'].toInt();
    humudity = jsonDecode(weatherdata)['main']['humidity'];
    visiblity = jsonDecode(weatherdata)['visibility'];
    speed = jsonDecode(weatherdata)['wind']['speed'];
    cityname = jsonDecode(weatherdata)['name'];

    pressure = jsonDecode(weatherdata)['main']['pressure'];
    cond = jsonDecode(weatherdata)['weather'][0]['id'];

    weathericon = weathermodel.getWeatherIcon(cond);
    image = weathermodel.getImage(tempreture);

    description = weathermodel.getMessage(tempreture);
    print(image);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(237, 6, 6, 0),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  var cityname = Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchCity()));

                  if (cityname != null) {
                    var cityweather = weathermodel.getweatherbycity(cityname);
                    Updateui(cityweather);
                    print(cityweather);
                  }
                });
              },
              icon: Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ))
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on),
            Text(
              '$cityname',
              style: TextStyle(
                  backgroundColor: Color.fromARGB(0, 50, 50, 50),
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('$image'),
          fit: BoxFit.cover,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              '$tempreture°',
              style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 250, 247, 247)),
            ),
            Text("$description",
                style: TextStyle(
                    fontSize: 30, color: Color.fromARGB(255, 245, 245, 245))),
            Row(
              children: [
                Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.all(10)),
                          Text(
                            "Tempreture",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("$tempreture°",
                              style: TextStyle(color: Colors.white)),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Condition",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          SizedBox(
                            height: 10,
                          ),
                          Text(weathericon!,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 50)),
                        ],
                      )),
                ),
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.all(20),
                      height: 200,
                      width: 300,
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.all(10)),
                          Text("On the day",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.all(10)),
                              Icon(
                                Icons.arrow_upward,
                                size: 30,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text("max",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                              SizedBox(
                                width: 10,
                              ),
                              Text("$maximum°",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25))
                            ],
                          ),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.all(10)),
                              Icon(
                                Icons.arrow_downward,
                                size: 30,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "min",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("$minimum°",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25))
                            ],
                          ),
                        ],
                      )),
                )
              ],
            ),
            Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(10),
                height: 200,
                width: 200,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.all(20)),
                        Text(
                          "Humudity",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(width: 200),
                        Text(
                          "$humudity%",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.all(20)),
                        Text(
                          "Pressure",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(width: 150),
                        Text(
                          "$pressure mBar",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.all(20)),
                        Text(
                          "Visiblity",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(width: 170),
                        Text(
                          "$visiblity km",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.all(20)),
                        Text(
                          "Wind speed",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(width: 130),
                        Text(
                          "$speed km/hr",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  SizedBox(width: 40),
                  Text(
                    "Sunrise:",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(width: 17),
                  Text(
                    "3:35",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(width: 15),
                  // Icon(
                  //   Icons.icon,
                  //   size: 50,
                  //   color: Colors.yellow,
                  // ),
                  Text(
                    weathericon!,
                    style: TextStyle(fontSize: 20),
                  ),

                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Sunset",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(width: 15),
                  Text(
                    "7:75",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
