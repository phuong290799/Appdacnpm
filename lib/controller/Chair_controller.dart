import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticketapp/Controller/Home_controller.dart';
import 'package:ticketapp/Controller/Login_controller.dart';
import 'package:ticketapp/Models/SeatInfor.dart';
import 'package:ticketapp/Models/accountObj.dart';
import 'package:ticketapp/Models/chairObj.dart';
import 'package:ticketapp/Models/seats.dart';
import 'package:ticketapp/Models/ticketInforObj.dart';
import 'package:ticketapp/Notify/notify.dart';
import 'package:ticketapp/http/request.dart';

class ChairController extends GetxController{
  HomeController homeController=Get.find();
  LoginController loginController=Get.find();
  late TextEditingController name;
  late TextEditingController sdt;
  late TextEditingController diachi;
  late TextEditingController cmnd;

  var maCX;
  late AccountObj accountObj=loginController.accountObj;
  List<TicketInforObj> listTicketed = [];
  List<SeatInfor> listSelected = [];
  var listSeat=<Seats>[].obs;
  List<ChairObj> listChair = [
    ChairObj(
      01,
      "A1",
      true,
      Colors.white,
    ),
    ChairObj(
      02,
      "A2",
      false,
      Colors.white,
    ),
    ChairObj(03, "A3", false, Colors.white),
    ChairObj(04, "B1", false, Colors.white),
    ChairObj(05, "B2", false, Colors.white),
    ChairObj(06, "B3", false, Colors.white),
    ChairObj(07, "A4", false, Colors.white),
    ChairObj(08, "A5", false, Colors.white),
    ChairObj(09, "A6", true, Colors.white),
    ChairObj(10, "B4", true, Colors.white),
    ChairObj(11, "B5", false, Colors.white),
    ChairObj(12, "B6", false, Colors.white),
    ChairObj(13, "A7", true, Colors.white),
    ChairObj(14, "A8", false, Colors.white),
    ChairObj(15, "A9", false, Colors.white),
    ChairObj(16, "B7", false, Colors.white),
    ChairObj(17, "B8", false, Colors.white),
    ChairObj(18, "B9", false, Colors.white),
    ChairObj(19, "A10", false, Colors.white),
    ChairObj(20, "A11", false, Colors.white),
    ChairObj(21, "A12", false, Colors.white),
    ChairObj(22, "B10", false, Colors.white),
    ChairObj(23, "B11", false, Colors.white),
    ChairObj(24, "B12", false, Colors.white),
    ChairObj(25, "A13", false, Colors.white),
    ChairObj(26, "A14", false, Colors.white),
    ChairObj(27, "A15", false, Colors.white),
    ChairObj(28, "B13", false, Colors.white),
    ChairObj(29, "B14", false, Colors.white),
    ChairObj(30, "B15", false, Colors.white),
    ChairObj(31, "A16", false, Colors.white),
    ChairObj(32, "A17", false, Colors.white),
    ChairObj(33, "A18", false, Colors.white),
    ChairObj(34, "B16", false, Colors.white),
    ChairObj(35, "B17", false, Colors.white),
    ChairObj(36, "B18", false, Colors.white),
  ];
  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   apiGetChair();
  //   super.onInit();
  // }
  @override
  void onInit() {
    sdt=TextEditingController();
    name=TextEditingController();
    diachi=TextEditingController();
    cmnd=TextEditingController();
    sdt.text=loginController.accountObj.sdt;
    name.text=loginController.accountObj.tenNd;
    cmnd.text=loginController.accountObj.cmnd;
    diachi.text=loginController.accountObj.diaChi;

apiGetInfo();
    // TODO: implement onInit
    super.onInit();
  }

  void apiGetInfo()async{
    var headers = {"Content-type": "application/json"};
    //SharedPreferences prefs= await SharedPreferences.getInstance();
    //int VaiTro=prefs.getInt("VaiTro")??0;
     int VaiTro=3;
    print("Vai tro ${VaiTro}");
    String url=VaiTro==3?"https://qlbvxk.herokuapp.com/api/customers/${loginController.accountObj.maNd}":"https://qlbvxk.herokuapp.com/api/staffs/${loginController.accountObj.maNd}";
    Request request = Request(
        Url: url,
        body: jsonEncode({
          "TenNd" : name.text,
          "Sdt" : sdt.text,
          "Cmnd" : cmnd.text,
          "DiaChi" : diachi.text,
          "NgaySinh" : "1999-11-11"
        }),
        header: headers);
    request.get().then((value){
      if(value.statusCode==200){
        var info=json.decode(value.body);
        print(info);
        loginController.accountObj=AccountObj.fromJson(info);

      }

    }).catchError((onError){
      print("Loii ${onError.toString()}");
    });
  }


  void apiUpdateInfo() async{

    var headers = {"Content-type": "application/json"};
    SharedPreferences prefs= await SharedPreferences.getInstance();
    int VaiTro=prefs.getInt("VaiTro")??0;
    String url=VaiTro==3?"https://qlbvxk.herokuapp.com/api/customers/${loginController.accountObj.maNd}":"https://qlbvxk.herokuapp.com/api/staffs/${loginController.accountObj.maNd}";
    Request request = Request(
        Url:url,
        body: jsonEncode({
          "TenNd" : name.text,
          "Sdt" : sdt.text,
          "Cmnd" : cmnd.text,
          "DiaChi" : diachi.text,
          "NgaySinh" : "1999-11-11"
        }),
        header: headers);
    request.put().then((value){
      if(value.statusCode==204){
        print(value.statusCode);
        print("thanh cong");
        print(value.statusCode);
        print("thanh cong");
        apiGetInfo();

      }

    }).catchError((onError){
      print("Loi ${onError.toString()}");
    });
  }


  @override
  void apiBookTicket( String s) async{
    Get.dialog(Center(child: CircularProgressIndicator()),barrierDismissible: false);
    var headers = {"Content-type": "application/json"};
    Request request = Request(
        Url: "https://qlbvxk.herokuapp.com/api/tickets/",
        body: jsonEncode({
          "MaKh" : loginController.accountObj.maNd,
          "MaChoNgoi" : [s],
          "MaChuyenXe" : homeController.maCx,
          "GhiChu": "Go"
        }),
        header: headers);
    request.post().then((value){
      if(value.statusCode==200){
        print(value.statusCode);
        Get.back();
        Get.offAll(()=>Notify());
      }

    }).catchError((onError){
      print("Loi ${onError.toString()}");
    });
    print(request.Url);
    print("[$s]");
    print("[${homeController.maCx}]");
    print("[${loginController.accountObj.maNd}]");
  }

  void apiGetChair(mabx) async{
    print("load");
    var headers = {"Content-type": "application/json"};
    Request request = Request(
        Url: "https://qlbvxk.herokuapp.com/api/seats/search?bustripid=${mabx}",
        body: jsonEncode({"Email": "i", "MatKhau": "i"}),
        header: headers);
    request.get().then((value){
      print(request.Url);
      var responsedata=jsonDecode(value.body) as List;
      listSeat.value=[];
      listSeat.value=responsedata.map((e){
        return Seats.fromJson(e);
      }).toList();
      print(listSeat.length);

      for(int i=0; i<listSeat.length; i++){
        listChair[i].id=listSeat[i].maChoNgoi;
        listChair[i].tinhtrang=listSeat[i].tinhTrangChoNgoi;
      }
    }).catchError((onError){
      print("Loi chair: ${onError.toString()}");
    });
  }
}