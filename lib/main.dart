import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'file:///E:/flutter2/ticketapp/lib/screen/Home/bottom_nav_bar.dart';

import 'package:ticketapp/LocalizationService.dart';
import 'package:ticketapp/screen/splash.dart';
import 'package:ticketapp/test.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
     // home:bottomNav(),
      // locale: LocalizationService.locale,
      // fallbackLocale: LocalizationService.fallbackLocale,
      // translations: LocalizationService(),
      home: Splash(),
    );
  }
}

