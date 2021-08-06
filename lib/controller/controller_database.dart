import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'file:///E:/flutter2/ticketapp/lib/screen/Home/ketquaSearch.dart';
import 'package:ticketapp/Models/busStation_model.dart';
import 'package:ticketapp/Models/ticket_model.dart';
import 'package:ticketapp/database/database_request.dart';

class ControllerDatabase extends GetxController {
  static ControllerDatabase get to => Get.find();
  var day = "".obs;
  final TextEditingController noidi = TextEditingController();
  final TextEditingController noiden = TextEditingController();
  List<Ticket_model> listsearch2 = [];

  void apiGetAllBusStation() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    var headers = {"Content-type": "application/json"};
    Request request = Request(
        Url: "https://qlbvxk.herokuapp.com/api/busstations",
        body: jsonEncode({"Email": noidi.text, "MatKhau": noiden.text}),
        header: headers);
    request.get().then((value) {
      var responseData = jsonDecode(value.body) as List;
      List<BusStation_model> ListBusStation = responseData.map((e) {
        return BusStation_model(maBx: e["maBx"], tenBx: e["tenBx"]);
      }).toList();
      print("listlength: ${ListBusStation.length}");
      tk(ListBusStation);
    }).catchError((e) {
      print("loi ${e.toString()}");
    });
  }

  void tk(List<BusStation_model> s) {
    if (s.length != 0) {
      if (getMaBx(s, noidi.text.toUpperCase()) != 0) {
        if (getMaBx(s, noiden.text.toUpperCase()) != 0) {
          print(getMaBx(s, noidi.text.toUpperCase()));
          print(getMaBx(s, noiden.text.toUpperCase()));
          int maBxdi = getMaBx(s, noidi.text.toUpperCase());
          int maBxden = getMaBx(s, noiden.text.toUpperCase());
          String url =
              "https://qlbvxk.herokuapp.com/api/bustrips/search?dep=$maBxdi&dest=$maBxden&date=${Swap(day.value)}";
          var headers = {"Content-type": "application/json"};
          print(url);
          Request request = Request(
              Url: url,
              body: jsonEncode({"Email": noidi.text, "MatKhau": noiden.text}),
              header: headers);
          request.get().then((value) {
            if (value.body != "") {
              var responseDatas = json.decode(value.body);
             listsearch2= responseDatas.map((e) {
                return Ticket_model.fromJson(e);
              });

              Get.back();
              Get.to(() => KetquaSearch(
                    noidi: getTenBx(s, noidi.text.toUpperCase()),
                    noiden: getTenBx(s, noiden.text.toUpperCase()),
                    day: day.value,
                  ));
            } else
              print("size null");
          });
        } else {
          Get.back();
          Get.to(() => KetquaSearch(
                noidi: getTenBx(s, noidi.text),
                noiden: getTenBx(s, noiden.text),
                day: day.value,
              ));
        }
      } else {
        Get.back();
        Get.to(() => KetquaSearch(
              noidi: getTenBx(s, noidi.text),
              noiden: getTenBx(s, noiden.text),
              day: day.value,
            ));
      }
    }
  }

  int getMaBx(List<BusStation_model> bus, String s) {
    for (int i = 0; i < bus.length; i++) {
      if (bus[i].tenBx.toUpperCase().contains(s)) {
        return bus[i].maBx;
      }
    }
    return 0;
  }

  String getTenBx(List<BusStation_model> bus, String s) {
    for (int i = 0; i < bus.length; i++) {
      if (bus[i].tenBx.toUpperCase().contains(s)) {
        String ss = bus[i].tenBx.substring(7, bus[i].tenBx.length);
        String sss = ss[0];
        sss = sss.toUpperCase();
        ss = ss.replaceRange(0, 1, sss);
        return ss;
      }
    }
    return "hi";
  }

  String Swap(String s) {
    String yyyy = s.substring(6, s.length);
    String mm = s.substring(2, 6);
    String dd = s.substring(0, 2);
    print("${dd + mm + yyyy}");
    return (yyyy + mm + dd);
  }
}
