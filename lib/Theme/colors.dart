import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Controller/controller_theme.dart';
import 'package:ticketapp/Theme/styles.dart';

class AppColors {
  ControllerTheme controller_theme = Get.find();
  static final AppColors _appConstant =AppColors._internal();

  factory AppColors() {
    return _appConstant;
  }

  AppColors._internal();
  static const Color primary = Color(0xffffffff);
  static const Color color_snackbar = Colors.greenAccent;
  static  Color background = Color(0xff716EEE);

  static const Color scaffold = Color(0xffffffff);
  static const Color colors_container = Color(0xff702DE3);
  static const Color colors_icons = Color(0xffffffff);
  static Color shadow = Color(0xff000000);
}