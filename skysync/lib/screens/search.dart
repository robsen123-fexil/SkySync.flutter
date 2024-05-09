// ignore_for_file: prefer_const_constructors, unnecessary_import, avoid_unnecessary_containers, unused_import, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:skysync/screens/resultpage.dart';

class SearchCity extends StatefulWidget {
  const SearchCity({super.key});

  @override
  State<SearchCity> createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {
  String? cityname;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              icon: Icon(Icons.arrow_back_ios))
        ],
      ),
      body: Column(
        children: [
          Container(
            width: 500,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 130, 128, 128)),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.grey)),
              style: TextStyle(color: Colors.black),
              onChanged: (value) {
                cityname = value;
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context , cityname);
                },
                child: Text("Get Weather")),
          )
        ],
      ),
    ));
  }
}
