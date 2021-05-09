import 'package:flutter/material.dart';

class AppColors {
  static final AppColors _appConstant =AppColors._internal();

  factory AppColors() {
    return _appConstant;
  }

  AppColors._internal();
  static const Color primary = Color(0xffffffff);
  static const Color color_snackbar = Colors.greenAccent;
  static const Color background = Color(0xff706EEE);
  static const Color scaffold = Color(0xffffffff);
  static const Color colors_container = Color(0xff702DE3);
  static const Color colors_icons = Color(0xffffffff);
  static Color shadow = Color(0xff000000).withOpacity(0.3);
}