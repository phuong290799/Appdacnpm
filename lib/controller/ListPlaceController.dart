
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Models/busPlace.dart';
import 'package:ticketapp/http/request.dart';

class ListPlaceController extends GetxController {
  late TextEditingController place;
  var listPalce=<BusPlace>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    place=TextEditingController();
    getApiPlace();
  }

  void getApiPlace() async {
    //Get.dialog(Center(child: CircularProgressIndicator()));
    var headers = {"Content-type": "application/json"};
    Request request=Request(Url:"https://qlbvxk.herokuapp.com/api/bustrips",header: headers);
    request.get().then((value){
    if(value.statusCode==200){
      var response=json.decode(value.body) as List;
      listPalce.value=response.map((e){
        return BusPlace.fromJson(e);
      }).toList();
      //Get.back();
    }

     // print(listPalce.length);
    }).catchError((e){
      print("Loi ${e.toString()}");
    });
  }
}
