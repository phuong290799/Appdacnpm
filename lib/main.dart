import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

import 'package:ticketapp/LocalizationService.dart';
import 'package:ticketapp/Login/login.dart';
import 'package:ticketapp/test.dart';


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
      ScreenUtil.init(
          BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
              maxHeight: MediaQuery.of(context).size.height),
          designSize: Size(360, 825),
          orientation: Orientation.portrait);
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





