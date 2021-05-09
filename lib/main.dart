import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Home/bott.dart';
import 'package:ticketapp/Home/bottomnav.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home:bottomNav(),
      //home: Login(),
    );
  }
}

