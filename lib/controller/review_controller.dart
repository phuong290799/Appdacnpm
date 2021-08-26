import 'dart:convert';

import 'package:get/get.dart';
import 'package:ticketapp/Models/reviews.dart';
import 'package:ticketapp/http/request.dart';

class ReviewController extends GetxController{
  var listReview=<Reviews> [].obs;
  var statusLoad=false.obs;
  var star=0.0.obs;

  int getStar(int start){
    int lenght=0;
    for(int i=0; i<listReview.length; i++){
      if(listReview[i].sao==start){
        lenght++;
      }
    }
    return lenght;
  }
  double averagenumberofstars(){
    return((5*getStar(5)+4*getStar(4)+3*getStar(3)+2*getStar(2)+1*getStar(1))/listReview.length);
  }
  apiGetReview(int MaNhaXe) async{
    final headers = {"Content-type": "application/json"};
    Request request = Request(
        Url: "https://qlbvxk.herokuapp.com/api/reviews/search?garageid=$MaNhaXe",
        header: headers);
    request.get().then((value){
      if(value.statusCode==200){
        listReview.value=(json.decode(value.body) as List).map((e){
          return Reviews.fromJson(e);
        }).toList();
        statusLoad.value=true;
        star.value=averagenumberofstars();
        print("Số sao trung bình: ${averagenumberofstars()}");
      }
      else
        {

        }
    }).catchError((onError){
      print("Lỗi load review $onError");
    });
  }
}