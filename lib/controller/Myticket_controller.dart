import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticketapp/Controller/Login_controller.dart';
import 'package:ticketapp/Models/myticket.dart';
import 'package:ticketapp/Models/reviews.dart';
import 'package:ticketapp/Myticket/myticketInfor.dart';
import 'package:ticketapp/http/request.dart';

class MyTicketController extends GetxController {
  var ListTicket = <MyTicket>[].obs;
  var ListTicketDelete = <MyTicket>[].obs;
  LoginController loginController = Get.find();
  var stt = 0.obs;
  late TextEditingController textReview;
  late TextEditingController starReview;
  late bool isReview=true;// mặc định vé chưa đanh giá
  late Reviews reviews;
  @override
  void onInit() {
    // TODO: implement onInit
    apiGetMyTicket();

    textReview=TextEditingController();
    starReview=TextEditingController();
    starReview.text="0";
    super.onInit();
  }

   apiSenToReview(int MaVe) async {
    Get.dialog(Center(child: CircularProgressIndicator()));
    SharedPreferences prefs= await SharedPreferences.getInstance();
    int MaND=prefs.getInt("MaND")??0;
    final headers = {"Content-type": "application/json"};
    Request request = Request(
        Url: "https://qlbvxk.herokuapp.com/api/reviews/",
        body: jsonEncode(
            {"MaNd": MaND, "MaVe":MaVe , "Sao": int.parse(starReview.text), "NoiDungDanhGia": textReview.text}),
        header: headers);
    request.post().then((value){
      print("Status code: ${value.statusCode}");
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

        textReview.text="";
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
      print("SO VE DA HUY: ${ListTicketDelete.length}");
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


  apiIsReviewTicket(int MaVeXe)async{
    //Kiểm tra xem khách đã đánh giá chuyến đi chưa
    final headers = {"Content-type": "application/json"};
    Request request = Request(
        Url: "https://qlbvxk.herokuapp.com/api/reviews/ticket?ticketid=$MaVeXe",
        header: headers);
    request.get().then((value){
      if(value.statusCode==200){
        print("Vé đã đánh giá");
        reviews=Reviews.fromJson(json.decode(value.body));
        textReview.text=reviews.noiDungDanhGia;
        starReview.text=reviews.sao.toString();
        this.isReview=false;
        ;//vé đã đánh giá

      }
      if(value.statusCode==404){
        print("Vé chưa đánh giá");
        this.isReview=true;
        ;// vé chưa đánh giá
      }else{
        ;//lỗi  khác
      }
    }).catchError((onError){

    });
  }
  apiEditReview() async {
    Get.dialog(Center(child: CircularProgressIndicator()));
    SharedPreferences prefs= await SharedPreferences.getInstance();
    final headers = {"Content-type": "application/json"};
    Request request = Request(
        Url: "https://qlbvxk.herokuapp.com/api/reviews/${reviews.maDanhGia}",
        body: jsonEncode(
            {"Sao": int.parse(starReview.text),"NoiDungDanhGia": textReview.text}),
        header: headers);
    request.put().then((value){
      print("Status code: ${value.statusCode}");
      if(value.statusCode==204){
        print("edit Đánh giá thành công");
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

        textReview.text="";
      }
      else{
        print("edit Đánh giá thất bại");
      }
    });
  }
}
