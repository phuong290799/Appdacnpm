

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stripe_payment/stripe_payment.dart';

import 'package:ticketapp/Models/ticketObj.dart';
import 'package:ticketapp/http/request.dart';

class ChairController extends GetxController{
  /*late TicketObj obj;
  late String Time;
*/
  late TextEditingController amount;
  late TextEditingController Name;
  late TextEditingController Note;
  late TextEditingController cardNumberController ;

  late TextEditingController expDateController;
  late TextEditingController cVCController ;
  //late TextEditingController Note;

  var ListSeat=<int>[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1].obs;
  var statusLoad=false.obs;
  var ListSeatBook=<int>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();


    amount=TextEditingController();
    Note=TextEditingController();
    Name=TextEditingController();
   cardNumberController=TextEditingController();
   expDateController=TextEditingController();
   cVCController=TextEditingController();
    amount.text="0";
    Name.text="NGUYEN BA THANH";
    cardNumberController.text="4242424242424242";
    expDateController.text="04/25";
    cVCController.text="123";
    StripePayment.setOptions(
        StripeOptions(publishableKey: "pk_test_51JPl1NHZ9JYY3XSIHkMBfRAIuRMPMXGCA1kPs6J1zFqMybHngx4jeRDmd11KZaVOcq2iXWBqUmpRDiv6IE06b8ij00vcCvWwrs", merchantId: "Test", androidPayMode: 'test')
    );
    print("2");
  }
  void apiBookTicket() async{

  }

  void payViaNewCard() async {
    final CreditCard card=CreditCard(
      name: this.Name.text,
      number: this.cardNumberController.text,
      expMonth:04, //int.parse(this.expDateController.text.substring(0,2)),
      expYear: 25,//int.parse(this.expDateController.text.substring(3,5)),
      cvc: this.cVCController.text
    );
    StripePayment.createTokenWithCard(card).then((token){
      print(token.tokenId);
    });
  /*Token token=await StripePayment.createTokenWithCard(card);
  print(token.tokenId);*/

  }

  void apiGetListSeatEmpty(TicketObj obj, String Time) async{
    var headers = {"Content-type": "application/json"};
    Request request = Request(
       // Url: "http://qlbvxk.herokuapp.com/api/tickets/seats?bustripid=1&date=2021-08-17T15:00:00",
        Url: "http://qlbvxk.herokuapp.com/api/tickets/seats?bustripid=${obj.maChuyenXe}&date=${Time.substring(6,10)}-${Time.substring(3,5)}-${Time.substring(0,2)}T${obj.gioXuatBen}",
        header: headers);
    print(request.Url);
    //print(ListSeat.length);
    request.get().then((value){
      List<dynamic> a=json.decode(value.body);
      //print(a[2]);
      if(value.statusCode==200){
        for(int i=0; i<ListSeat.length; i++){
          for(int j=0; j<a.length; j++){
            //print("A=${int.parse(a[j].toString())}");
            if(i+1==int.parse(a[j].toString())){
              ListSeat[i]=2;
              print(ListSeat[i]);

            }
          }
        }
        statusLoad.value=true;
      }

    }).catchError((e){
      print("ChairController Loi:${e.toString()}");
    });
  }

}