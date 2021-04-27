import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Models/accountObj.dart';
import 'package:ticketapp/Models/ticketObj.dart';

class Controller extends GetxController {
//  Color isSelect = Colors.white;
List<String> listSelected =[];
List<Color> listColor=[Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,
  Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,
  Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,
  Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,
  Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,
  Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,
];
  List<TicketObj> listsearch = [
    TicketObj("Hạnh Luyến", "Quảng Bình", "Đà Nẵng", "6h", "10h", 200000),
    TicketObj("Trung Tính", "Quảng Bình", "Đà Nẵng", "4h", "8h", 250000),
    TicketObj("Hạnh Luyến", "Quảng Bình", "Đà Nẵng", "13h", "17h", 220000),
    // TicketObj("Hoàng Long","Huế", "Đà Nẵng", "6h", "8h"),
    // TicketObj("Văn Phương","Huế", "Đà Nẵng", "8h", "10h"),
  ];
  List<String> listinforAccount = [
    "Phạm Văn Phương",
    "0776261632",
    "Quảng Bình",
    "phuong@gmail.com"
  ];
  List<String> listChair = [
    "A1",
    "A2",
    "A3",
    "B1",
    "B2",
    "B3",
    "A4",
    "A5",
    "A6",
    "B4",
    "B5",
    "B6",
    "A7",
    "A8",
    "A9",
    "B7",
    "B8",
    "B9",
    "A10",
    "A11",
    "A12",
    "B10",
    "B11",
    "B12",
    "A13",
    "A14",
    "A15",
    "A13",
    "A14",
    "B15",
  ];

  List<bool> IsSelectChair = [
    false,
    false,
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    true,
    true,
    true,
    true,
    false,
    false,
    false,
    false,
    true,
    true,
    false,
    false,
    false,
    true,
    false,
    false,
    false,
    true,
    false,
    false
  ];
}
