
import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticketapp/Models/ticketObj.dart';
import 'package:ticketapp/http/request.dart';

class ChairController extends GetxController{
  var ListSeat=<int>[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1].obs;
  var statusLoad=false.obs;
  var ListSeatBook=<int>[].obs;
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("2");
    apiGetListSeatEmpty();
  }
  void apiGetListSeatEmpty() async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    String url=prefs.getString("ListSeat")??"";
    print("Link url: $url");
    var headers = {"Content-type": "application/json"};
    Request request = Request(
       // Url: "http://qlbvxk.herokuapp.com/api/tickets/seats?bustripid=1&date=2021-08-17T15:00:00",
        Url: url,
        header: headers);
    print(request.Url);
    //print(ListSeat.length);
    request.get().then((value){
      List<dynamic> listseat=json.decode(value.body);//list ghế đã đặt
      //print(a[2]);
      if(value.statusCode==200){
        for(int i=0; i<ListSeat.length; i++){
          for(int j=0; j<listseat.length; j++){
            //print("A=${int.parse(a[j].toString())}");
            if(i==int.parse(listseat[j].toString())){
              ListSeat[i]=2;
              print(ListSeat[i]);

            }//đồng bộ vé trống và đã đặt
          }
        }
        statusLoad.value=true;
      }

    }).catchError((e){
      print("ChairController Loi:${e.toString()}");
    });
  }

}