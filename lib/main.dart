import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:ticketapp/Login/login.dart';



Future main() async {
  WidgetsFlutterBinding.ensureInitialized();//ervicesBinding.defaultBinaryMessenger was accessed before the binding was initialized.
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarIconBrightness: Brightness.light));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        builder: (BuildContext context, Widget?  child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(
            textScaleFactor: 0.8), //set desired text scale factor here,
        child: child??Container(),
      );},
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}





