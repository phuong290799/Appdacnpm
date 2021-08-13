import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:ticketapp/Controller/Login_controller.dart';
import 'package:ticketapp/Home/ketquaSearch.dart';
import 'package:ticketapp/Models/busstation.dart';
import 'package:ticketapp/Models/searchObj.dart';
import 'package:ticketapp/Models/ticketObj.dart';
import 'package:ticketapp/http/request.dart';

class HomeController extends GetxController {
  var maCx;
  var day = "".obs;
  final TextEditingController noidi = TextEditingController();
  final TextEditingController noiden = TextEditingController();
  var listHistory = <SearchObj>[].obs;
  LoginController loginController = Get.find();

  List<TicketObj> listsearch = [];
  @override
  void onInit() {
    gethistory();
    // TODO: implement onInit
    noidi.text="Hà Nội";
    noiden.text="Đà Nẵng";
    super.onInit();
  }

  @override
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
      List<BusStation> ListBusStation = responseData.map((e) {
        return BusStation(maBx: e["maBx"], tenBx: e["tenBx"]);
      }).toList();
      tk(ListBusStation);
    }).catchError((e) {
      print("loi ${e.toString()}");
    });
  }

  void tk(List<BusStation> s) {
    if (s.length != 0) {
      if (getMaBx(s, noidi.text.toUpperCase()) != 0) {
        if (getMaBx(s, noiden.text.toUpperCase()) != 0) {
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
              var responseDatas = json.decode(value.body) as List;
              listsearch = responseDatas.map((e) {
                return TicketObj.fromJson(e);
              }).toList();
              Get.back();
              SearchObj obj = SearchObj(
                  noiDen: getTenBx(s, noiden.text.toUpperCase()),
                  noiDi: getTenBx(s, noidi.text.toUpperCase()),
                  ngayDi: day.value);
              addHistory(obj);
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

  int getMaBx(List<BusStation> bus, String s) {
    for (int i = 0; i < bus.length; i++) {
      if (bus[i].tenBx.toUpperCase().contains(s)) {
        return bus[i].maBx;
      }
    }
    return 0;
  }

  String getTenBx(List<BusStation> bus, String s) {
    for (int i = 0; i < bus.length; i++) {
      if (bus[i].tenBx.toUpperCase().contains(s)) {
        String ss = bus[i].tenBx.substring(7, bus[i].tenBx.length);
        String sss = ss[0];
        sss = sss.toUpperCase();
        ss = ss.replaceRange(0, 1, sss);
        return ss;
      }
    }
    return s;
  }

  String Swap(String s) {
    String yyyy = s.substring(6, s.length);
    String mm = s.substring(2, 6);
    String dd = s.substring(0, 2);
    return (yyyy + mm + dd);
  }

  void addHistory(SearchObj obj) {
    int stt = 0;
    for (int i = 0; i < listHistory.length; i++) {
      SearchObj objj = listHistory[i];
      if (obj.ngayDi == objj.ngayDi &&
          obj.noiDi == objj.noiDi &&
          obj.noiDen == objj.noiDen) {
        stt = 1;
        break;
      }
    }
    if (stt == 0) {
      String url = "https://qlbvxk.herokuapp.com/api/histories";
      var headers = {"Content-type": "application/json"};
      Request request = Request(
          Url: url,
          body: jsonEncode({
            "MaNd": loginController.accountObj.maNd,
            "NoiDen": obj.noiDen,
            "NoiDi": obj.noiDi,
            "NgayDi": obj.ngayDi
          }),
          header: headers);
      request.post().then((value) {
        var responseData = jsonDecode(value.body) as List;
        listHistory.value = responseData.map((e) {
          return SearchObj.fromJson(e);
        }).toList();
        listHistory.value = new List.from(listHistory.reversed);
      }).catchError((onError) {
        print("Loii:${onError.toString()}");
      });
    }
  }

  void gethistory() async {
    String url =
        "https://qlbvxk.herokuapp.com/api/histories/${loginController.accountObj.maNd}";
    var headers = {"Content-type": "application/json"};
    Request request = Request(
        Url: url,
        body: {"noiDen": "i", "noiDi": "i", "ngayDi": "i"},
        header: headers);
    request.get().then((value) {
      var responsedata = jsonDecode(value.body) as List;
      listHistory.value = responsedata.map((e) {
        return SearchObj.fromJson(e);
      }).toList();
      listHistory.value = new List.from(listHistory.reversed);
    }).catchError((onError) {
      print("loi${onError.toString()}");
    });
  }

  void deleteHistory() async {
    var headers = {"Content-type": "application/json"};
    String url =
        "https://qlbvxk.herokuapp.com/api/histories/${loginController.accountObj.maNd}";
    Request request = Request(
        Url: url,
        body: {"noiDen": "i", "noiDi": "i", "ngayDi": "i"},
        header: headers);
    request.delete().then((value) {
      if (value.statusCode == 204) {
        print("thanh cong");
        gethistory();
      } else
        print("that bai");
    }).catchError((onError) {
      print("Loi delete${onError.toString()}");
    });
  }
}
