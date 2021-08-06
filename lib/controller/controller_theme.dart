import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Models/colorsObj.dart';

class ControllerTheme extends GetxController{
  List<ColorsObj> listColors =[ColorsObj("Màu đỏ", Colors.red),
    ColorsObj("Màu đen", Colors.black),
    ColorsObj("Màu hồng", Colors.pinkAccent),
    ColorsObj("Màu xanh lục", Colors.green),
    ColorsObj("Màu vàng", Colors.yellow),
    ColorsObj("Màu xanh dương", Colors.blue),
    ColorsObj("Mặc định",  Color(0xff706EEE))];

}