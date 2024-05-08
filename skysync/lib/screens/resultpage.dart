// ignore_for_file: prefer_const_constructors, unnecessary_import, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
          home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(237, 6, 6, 0),
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Icon(Icons.location_on), 
              Text(
              "cityname",
              style: TextStyle(
                  backgroundColor: Color.fromARGB(0, 50, 50, 50),
                  color: Color.fromARGB(255, 255, 255, 255)),
                  
            ),
            
            SizedBox(width:10),
            
            ],
          ),
        
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/download.jpeg'),
            fit: BoxFit.cover,
          )),
          child: Column( 
            
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ 
            Text("32" , style: TextStyle(fontSize: 30 , color: const Color.fromARGB(255, 255, 255, 255)),), 
            Text("shower rain" , style: TextStyle(fontSize: 30 , color: Color.fromARGB(255, 255, 255, 255))), 
            Row(children: [ 
              Expanded(
                child: Container( 
                  margin: EdgeInsets.only(left:10),
                  
                  height: 200,
                  width: 200,
                
                  decoration: BoxDecoration(color:Colors.black.withOpacity(0.5) ,borderRadius: BorderRadius.circular(10)),
                  child:Column(
                    
                    children: [
                    Padding(padding: EdgeInsets.all(10)),
                    Text("Tempreture",  style: TextStyle(color:Colors.white , fontSize: 20),), 
                    SizedBox(
                      height: 10,
                    ),
                   
                    
                    Text("34",style: TextStyle(color:Colors.white)),
                    SizedBox(
                              height: 10,
                            ),
                    Text("Feels like" , style: TextStyle(color: Colors.white, fontSize: 20)),
                    SizedBox(
                              height: 10,
                            ),
                    Text("43"  , style: TextStyle(color: Colors.white)),
                  ],)
                 ),
              ), 
               Expanded(
                 child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.all(20),
                        height: 200,
                        width:300,
                        child: Column(children: [ 
                          Padding(padding: EdgeInsets.all(10)), 
                          Text("On the day " , style:TextStyle(color: Colors.white, fontSize: 20 )), 
                          SizedBox(height: 20,),
                          Row(children: [

                            Padding(padding: EdgeInsets.all(10)),

                            Icon(Icons.arrow_upward , size: 30, color: Colors.white,), 
                            SizedBox(
                              width: 20,
                            ) ,
                            Text("max",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)) ,
                                        SizedBox(width: 10,),
                                         Text("37",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15))],),
                                        SizedBox(height:30),
                          Row(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Icon(Icons.arrow_downward, size: 30, color: Colors.white,),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("min" , style: TextStyle(color:Colors.white , fontSize: 20),),
                                SizedBox( width: 10,), 
                                Text("33",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15))
                              ],
                            ),
                        ],)),
               )
            ],), 
            Container(
              decoration: BoxDecoration(  
                color:Colors.black.withOpacity(0.5) , 
                borderRadius: BorderRadius.circular(10),
                
              ),
              margin: EdgeInsets.all(10),
              height: 200,
              width: 200,
              child:Column(children: [
                Row(children: [ 
                  Padding(padding: EdgeInsets.all(20)), 
                    Text("Humudity" ,
                            style: TextStyle(color: Colors.white, fontSize: 20), ), 
                            SizedBox(width:200) ,
                        Text(                
                            "11%",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                             ]
                            
                            
                            ,), 
                            Row(
                        children: [
                           Padding(padding: EdgeInsets.all(20)), 
                          Text(
                            "Presurre",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            
                          ), SizedBox(width: 150),
                          Text(
                            "1006 mBar",
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
                          ), SizedBox(width: 200),
                          Text(
                            "6 km",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ) , 
                      Row(
                        children: [
                            Padding(padding: EdgeInsets.all(20)), 
                          Text(
                            "Wind speed",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ), SizedBox(width: 130),
                          Text(
                            "16.67 km/hr",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ), 
                      
              ],)
            ), 
            Container(
              decoration: BoxDecoration( 
                color:Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20), 

              ),
              child: Row(children: [ 
                SizedBox(width:30), 
                Text( "Sunrise:" ,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                   SizedBox(width:10),
                   Text("3:35",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ) , 
                    SizedBox(
                      width:10
                    ),
                    Icon(Icons.sunny , size: 50 , color: Colors.yellow,), 
                    SizedBox(
                      width: 10,
                    ),
                    Text("Sunset",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ) , 
                    SizedBox(
                      width:10
                    ),
                   Text(
                      "7:75",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(width: 10),
              ],),
            )

            
          ],
            
            ), 
           
        ),
      )),
    );
  }
}
