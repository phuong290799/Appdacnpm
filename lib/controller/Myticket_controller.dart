import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Controller/Login_controller.dart';
import 'package:ticketapp/Models/myticket.dart';
import 'package:ticketapp/http/request.dart';

class MyTicketController extends GetxController{
  var ListTicket=<MyTicket>[].obs;
  var ListTicketDelete=<MyTicket>[].obs;
  LoginController loginController=Get.find();
  var stt=0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    apiGetMyTicket();
    super.onInit();
  }
  void apiDelete(MyTicket ticket) async{
    var headers = {"Content-type": "application/json"};
    Request request = Request(
        Url: "https://qlbvxk.herokuapp.com/api/tickets/${ticket.maVe}",
        body: jsonEncode({ "maVe": 54,
          "tenKh": "i",
          "sdt": "i",
        }),
        header: headers);
    request.delete().then((value){
      ListTicketDelete.value.add(ticket);
      print("thanh cong");
    }).catchError((e){
      print(e.toString());
    });

  }
  void apiGetMyTicket() async{
    var headers = {"Content-type": "application/json"};
    Request request = Request(
        Url: "https://qlbvxk.herokuapp.com/api/tickets/search?userId=${loginController.accountObj.maNd}",
        body: jsonEncode({ "maVe": 54,
          "tenKh": "i",
          "sdt": "i",
        }),
        header: headers);
    print("Url:${request.Url}");
    request.get().then((value){
      var responseData=jsonDecode(value.body) as List;
      print("thông tin $responseData");
      ListTicket.value=responseData.map((e){
        return MyTicket.fromJson(e);
      }).toList();
      stt.value=1;
      print("Size: ${ListTicket.length}");
    }).catchError((onError){
      print("Loi: ${onError.toString()}");
    });
  }

  String filter(MyTicket myTicket){
    DateTime s1=DateTime.parse(myTicket.ngayXuatBen);
    DateTime s2=DateTime.now();
    var time=s1.difference(s2);
    print(s1);
    print(s2);
    print("time: $time");
   String s=time.toString().substring(0,1);
    print(s);
    return s;
  }
  List<MyTicket> list(int s){
    List<MyTicket> ListTicket=[];
    if(s==0){
      for(int i=0; i<this.ListTicket.length; i++){
        if(filter(this.ListTicket[i])=="-"){
          ListTicket.add(this.ListTicket[i]);
        }
      }
      return ListTicket;
    }
    else{
      for(int i=0; i<this.ListTicket.length; i++){
        if(filter(this.ListTicket[i])!="-"){
          ListTicket.add(this.ListTicket[i]);
        }
      }
      print("size = ${ListTicket.length}");
      return ListTicket;
    }
  }
}