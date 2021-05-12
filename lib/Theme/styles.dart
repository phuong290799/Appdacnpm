import 'package:flutter/material.dart';

class AppThemes {
  static final AppThemes _appConstant =AppThemes._internal();

  factory AppThemes() {
    return _appConstant;
  }

  AppThemes._internal();

  static TextStyle text18container = TextStyle(
      fontSize: 18, color: Color(0xffffffff),fontFamily:'Roboto_Medium');
  static TextStyle text30container = TextStyle(
      fontSize: 30, color: Color(0xffffffff),fontFamily:'Roboto_Bold');

  static const TextStyle Text14Medium = TextStyle(
      fontSize: 14, color: Color(0xff292929),fontFamily:'Roboto_Medium');
  static const TextStyle Text16Medium = TextStyle(
      fontSize: 16, color: Color(0xff292929),fontFamily:'Roboto_Medium');
  static const TextStyle Text18Medium = TextStyle(
      fontSize: 18, color: Color(0xff292929),fontFamily:'Roboto_Medium');
  static const TextStyle Text20Medium = TextStyle(
      fontSize: 20, color: Color(0xff292929),fontFamily:'Roboto_Medium');


  static const TextStyle Text14Bold = TextStyle(
      fontSize: 14, color: Color(0xff292929),fontFamily:'Roboto_Bold');
  static const TextStyle Text16Bold = TextStyle(
      fontSize: 16, color: Color(0xff292929),fontFamily:'Roboto_Bold');
  static const TextStyle Text18Bold = TextStyle(
      fontSize: 18, color: Color(0xff292929),fontFamily:'Roboto_Bold');
  static const TextStyle Text20Bold = TextStyle(
      fontSize: 20, color: Color(0xff292929),fontFamily:'Roboto_Bold');

  static const TextStyle Text14 = TextStyle(
      fontSize: 14, color: Color(0xff292929),fontFamily:'Roboto_Regular');
  static const TextStyle Text16 = TextStyle(
      fontSize: 16, color: Color(0xff292929),fontFamily:'Roboto_Regular');
  static const TextStyle Text18 = TextStyle(
      fontSize: 18, color: Color(0xff292929),fontFamily:'Roboto_Regular');
  static const TextStyle Text20 = TextStyle(
      fontSize: 20, color: Color(0xff292929),fontFamily:'Roboto_Regular');
  static const Color scaffold2 = Color(0xffffffff);






  static const double paddingSmall = 8.0;
  static const double padding10 = 10.0;
  static const double paddingDefault = 16.0;
  static const double paddingMedium = 20.0;
  static const double paddingLarge = 24.0;
  static const double padding32 = 32.0;
  static const double heightButton = 50.0;
  static const double borderRadiusBtn = 12;
  static const double heightBannerAdmob = 65.0;
  static const double heightItemLetter = 40.0;
}