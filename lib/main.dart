import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

import 'package:ticketapp/LocalizationService.dart';
import 'package:ticketapp/Login/login.dart';
import 'package:ticketapp/test.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();//ervicesBinding.defaultBinaryMessenger was accessed before the binding was initialized.
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarIconBrightness: Brightness.light));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
     // home:bottomNav(),
      // locale: LocalizationService.locale,
      // fallbackLocale: LocalizationService.fallbackLocale,
      // translations: LocalizationService(),
      home: Login(),
    );
  }
}

