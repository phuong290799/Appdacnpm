import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticketapp/Controller/Login_controller.dart';
import 'package:ticketapp/Models/myticket.dart';
import 'package:ticketapp/http/request.dart';

class MyTicketController extends GetxController {
  var ListTicket = <MyTicket>[].obs;
  var ListTicketDelete = <MyTicket>[].obs;
  LoginController loginController = Get.find();
  var stt = 0.obs;
  late TextEditingController Evaluate;

  @override
  void onInit() {
    // TODO: implement onInit
    apiGetMyTicket();
    Evaluate=TextEditingController();
    super.onInit();
  }

  void apiEvaluate(int start, int MaNhaXe) async {
    Get.dialog(Center(child: CircularProgressIndicator()));
    SharedPreferences prefs= await SharedPreferences.getInstance();
    int MaND=prefs.getInt("MaND")??0;
    final headers = {"Content-type": "application/json"};
    Request request = Request(
        Url: "https://qlbvxk.herokuapp.com/api/reviews/",
        body: jsonEncode(
            {"MaNd": MaND, "MaNhaXe": 1, "Sao": start, "NoiDungDanhGia": Evaluate.text}),
        header: headers);
    request.post().then((value){
      if(value.statusCode==201){
        print("Đánh giá thành công");

        Timer timer = Timer(Duration(milliseconds: 1000), (){
          Get.back();
          Get.back();
          Get.back();
          Get.back();

        });
        Get.dialog(
            AlertDialog(

                content: Container(
                  height: 80,
                  //color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Thông báo",style:TextStyle(color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Container(
                        height: 1,
                        color: Color(0xffcecece),
                      ),
                      SizedBox(height: 20)
                      ,                    Text("Cảm ơn bạn đã đánh giá",style:TextStyle(color:Color(0xff777777), fontSize: 20,))
                    ],
                  ),
                )
            )
        ).then((value){
          if (timer.isActive) {
            timer.cancel();
          }
        });
        //Get.back();
        //Get.back();
       // Get.back();
        //Get.back();
        Evaluate.text="";
      }
      else{
        print("Đánh giá thất bại");
      }
    });
  }

  void apiDelete(MyTicket ticket) async {
    var headers = {"Content-type": "application/json"};
    Request request = Request(
        Url: "https://qlbvxk.herokuapp.com/api/tickets/${ticket.maVe}",
        body: jsonEncode({
          "maVe": 54,
          "tenKh": "i",
          "sdt": "i",
        }),
        header: headers);
    request.delete().then((value) {
      stt.value = 0;
      apiGetMyTicket();
      Get.back();
      print("thanh cong");
    }).catchError((e) {
      print(e.toString());
    });
  }

  void apiGetMyTicket() async {
    var headers = {"Content-type": "application/json"};
    Request request = Request(
        Url:
            "https://qlbvxk.herokuapp.com/api/tickets/search?userId=${loginController.accountObj.maNd}",
        header: headers);
    //print("Url:${request.Url}");
    request.get().then((value) {
      var responseData = jsonDecode(value.body) as List;
      //print("thông tin $responseData");
      List<MyTicket> list = responseData.map((e) {
        return MyTicket.fromJson(e);
      }).toList();
      ListTicketDelete.value = list.where((element) {
        return element.trangThai == false;
      }).toList();
      ListTicket.value = list.where((element) {
        return element.trangThai == true;
      }).toList();
      stt.value = 1;
      //print("Size: ${ListTicket.length}");
    }).catchError((onError) {
      print("Loi: ${onError.toString()}");
    });
  }

  String filter(MyTicket myTicket) {
    DateTime s1 = DateTime.parse(myTicket.ngayDi);
    DateTime s2 = DateTime.now();
    var time = s1.difference(s2);
    // print(s1);
    //print(s2);
    //print("time: $time");
    String s = time.toString().substring(0, 1);
    //print(s);
    return s;
  }

  List<MyTicket> list(int s) {
    List<MyTicket> ListTicket = [];
    if (s == 0) {
      for (int i = 0; i < this.ListTicket.length; i++) {
        if (filter(this.ListTicket[i]) == "-") {
          ListTicket.add(this.ListTicket[i]);
          //print("${this.ListTicket[i].ngayDi.toString()}");
        }
      }
      return ListTicket;
    } else {
      for (int i = 0; i < this.ListTicket.length; i++) {
        if (filter(this.ListTicket[i]) != "-") {
          ListTicket.add(this.ListTicket[i]);
          //print("${this.ListTicket[i].ngayDi.toString()}");
        }
      }
      //print("size = ${ListTicket.length}");
      return ListTicket;
    }
  }
}
