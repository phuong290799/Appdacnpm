import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:ticketapp/Controller/Login_controller.dart';
import 'package:ticketapp/Home/Ticket.dart';
import 'package:ticketapp/Home/ketquaSearch.dart';
import 'package:ticketapp/Home/selectChair.dart';
import 'package:ticketapp/Models/myticket.dart';
import 'package:ticketapp/Models/ticketObj.dart';
import 'package:ticketapp/http/request.dart';

class ConfirmPaymentController extends GetxController {
late List<MyTicket> list;
  late TextEditingController amount;
  late TextEditingController Name;
  late TextEditingController Note;
  late TextEditingController cardNumberController;
  late TextEditingController expDateController;
  late TextEditingController cVCController;
  static String secret =
      'sk_test_51JPl1NHZ9JYY3XSIw0mmttzxhQLIA6zDAoYgxvtp16C4GOBoDwzNWnfeUlScrKGSqJ5VXp17eJRawNjIH5Xsh7nJ00hharY4Rl';
  LoginController loginController=Get.find();
  @override
  void onInit() {
    StripePayment.setOptions(StripeOptions(
        publishableKey:
            "pk_test_51JPl1NHZ9JYY3XSIHkMBfRAIuRMPMXGCA1kPs6J1zFqMybHngx4jeRDmd11KZaVOcq2iXWBqUmpRDiv6IE06b8ij00vcCvWwrs",
        merchantId: "Test",
        androidPayMode: 'test'));
    amount = TextEditingController();
    Note = TextEditingController();
    Name = TextEditingController();
    cardNumberController = TextEditingController();
    expDateController = TextEditingController();
    cVCController = TextEditingController();
    amount.text = "0";
    Name.text = "NGUYEN BA THANH";
    //cardNumberController.text = "4242424242424242";
    //expDateController.text = "04/25";
    //cVCController.text = "123";
    // TODO: implement onInit
    super.onInit();
  }

  String GetAmount() {
    String amounts = "";
    if (amount.text != "0") {
      for (int i = 0; i < amount.text.length - 4; i++) {
        if (amount.text[i] != ".") {
          amounts = amounts + amount.text[i];
        }
      }
      return amounts;
    } else
      return "0";
  }

   payViaNewCard(TicketObj obj, List<int> list,String day) async {
    Get.dialog(Center(child: CircularProgressIndicator()));
    final CreditCard card = CreditCard(
        name: this.Name.text,
        number: this.cardNumberController.text,
        expMonth: int.parse(this.expDateController.text.substring(0,2)),
        expYear: int.parse(this.expDateController.text.substring(3,5)),
        cvc: this.cVCController.text);
    StripePayment.createTokenWithCard(card).then((token) {

      print(token.tokenId);
      var body = {
        'amount': GetAmount(),
        'currency': 'vnd',
        'source': token.tokenId,
        'description': 'Thanh  toán vé xe'
      };
      Request request = Request(
          Url: "https://api.stripe.com/v1/charges",
          body: body,
          header: {
            'Authorization': 'Bearer ${secret}',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      request.post().then((value) {
        if (value.statusCode == 200) {
          print("thanh cong");
          apiBookTicket(obj, list,day);
        } if(value.statusCode==402) {
          print("That bai");

        }
      }).catchError((onError){
        print("that bai");
      });
    }).catchError((onError){
      Get.back();
      Timer timer = Timer(Duration(milliseconds: 1000), (){
        Get.back();

      });
      Get.dialog(
          AlertDialog(
              content: Container(
                height: 100,
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
                    SizedBox(height: 20),
                    Text("Thông tin thẻ bị sai, vui lòng nhập lại !",style:TextStyle(color:Color(0xff777777), fontSize: 20,))
                  ],
                ),
              )
          )
      ).then((value){
        if (timer.isActive) {
          timer.cancel();
        }
      });

    });

  }

 String setTime(String day, TicketObj obj){
    return "${day.substring(6,10)}-${day.substring(3,5)}-${day.substring(0,2)}T${obj.gioXuatBen}";
  }
  apiBookTicket(TicketObj obj, List<int> list,String day) async {
    print(day);
    for(int i=0; i<list.length; i++){
      print("hi: ${list[i]}");
    }
    Request request = Request(
        Url: "https://qlbvxk.herokuapp.com/api/tickets/",
        body: json.encode({
          "daThanhToan":double.parse(GetAmount())/list.length,
          "MaKh" : loginController.accountObj.maNd,
          "MaChoNgoi" : list,
          "MaChuyenXe" : obj.maChuyenXe,
          "NgayDi": setTime(day, obj),
          "GhiChu": Note.text
        }),header: {"Content-type": "application/json"});
    request.post().then((value) {
      if(value.statusCode==200){
        Get.back();
        var response=json.decode(value.body) as List;
        this.list=response.map((e){
          return MyTicket.fromJson(e);
        }).toList();
        Get.offAll(()=>Ticket(this.list,amount.text));
        print(value.statusCode);
      }
      else{
        Get.back();
        Timer timer = Timer(Duration(milliseconds: 1000), (){
          Get.back();

        });
        Get.dialog(
            AlertDialog(
                content: Container(
                  height: 100,
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
                      SizedBox(height: 20),
                      Text("Rất tiếc, vé không đặt thành công",style:TextStyle(color:Color(0xff777777), fontSize: 20,))
                    ],
                  ),
                )
            )
        ).then((value){
          if (timer.isActive) {
            timer.cancel();
          }
        });



      }
      print(setTime(day, obj));
      print(list);
      print(loginController.accountObj.maNd);
      print(value.statusCode);

    });
  }
}
