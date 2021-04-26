import 'package:get/get.dart';
import 'package:ticketapp/Models/accountObj.dart';
import 'package:ticketapp/Models/ticketObj.dart';

class Controller extends GetxController{
  List<TicketObj> listsearch=[TicketObj("Hạnh Luyến","Quảng Bình", "Đà Nẵng", "6h", "10h",200000),
    TicketObj("Trung Tính","Quảng Bình", "Đà Nẵng", "4h", "8h",250000),
    TicketObj("Hạnh Luyến","Quảng Bình", "Đà Nẵng", "13h", "17h",220000),
    // TicketObj("Hoàng Long","Huế", "Đà Nẵng", "6h", "8h"),
    // TicketObj("Văn Phương","Huế", "Đà Nẵng", "8h", "10h"),
  ];
  List<String> listinforAccount=["Phạm Văn Phương", "0776261632", "Quảng Bình", "phuong@gmail.com"];

}