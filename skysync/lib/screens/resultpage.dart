// ignore_for_file: prefer_const_constructors, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        
        backgroundColor: Color.fromRGBO(237, 6, 6, 0),
        elevation: 0,
        title: Text("cityname" , style: TextStyle(   backgroundColor: Color.fromARGB(130, 50, 50, 50), color: Color.fromARGB(255, 255, 255, 255)),),
        centerTitle: true,
      ),
       body:Container(
        
        decoration: BoxDecoration(image: DecorationImage(image:AssetImage('images/download.jpeg'), 
        fit:BoxFit.cover
        
        )),
        child: ,
       ) , 
       
      )
    );
  }
}