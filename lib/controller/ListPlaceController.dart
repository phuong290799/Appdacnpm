
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Models/busPlace.dart';
import 'package:ticketapp/http/request.dart';

class ListPlaceController extends GetxController {
  late TextEditingController place;
 // List<BusPlace> listPlace=[];
  var listPlaceDiObs=<BusPlace>[].obs;
  var listPlaceDenObs=<BusPlace>[].obs;
  var listPlace=<BusPlace>[].obs;

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
      listPlace.value=response.map((e){
        return BusPlace.fromJson(e);
      }).toList();
      listPlace.value=deleteItemDuplicate(listPlace.value);
      for(int i=0; i<listPlace.length; i++){
        print("bus: ${listPlace[i].tenBxDi}");
      }
      listPlace.sort((a,b)=>a.tenBxDi.toLowerCase().compareTo(b.tenBxDi.toLowerCase()));
      filterList();
      place.addListener(() {
        filterList();
      });
      //Get.back();
    }

     // print(listPalce.length);
    }).catchError((e){
      print("Loi ${e.toString()}");
    });
  }


  List<BusPlace> deleteItemDuplicate(List<BusPlace> list){
    for(int i=0; i<list.length; i++){
      for(int j=i+1; j<list.length; j++){
        if(list[i].tenBxDi==list[j].tenBxDi){
          list.removeAt(j);
        }
      }
    }
    return list;
  }

  filterList(){
    listPlaceDiObs.value=[];
    listPlaceDenObs.value=[];
    //print("x: ${listPlaceObs.length}");
    listPlaceDiObs.value.addAll(listPlace.value);
    listPlaceDenObs.value.addAll(listPlace.value);
    if(place.text.isNotEmpty){
      listPlaceDiObs.retainWhere((element) => element.tenBxDi.toLowerCase().contains(place.text.toLowerCase()));
      listPlaceDenObs.retainWhere((element) => element.tenBxDen.toLowerCase().contains(place.text.toLowerCase()));
    }
   /* for(int i=0; i<listPlaceObs.length; i++){
      print("busObs: ${listPlaceObs[i].tenBxDi}");
    }*/

  }
}
