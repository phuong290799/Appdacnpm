import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticketapp/Home/bottom_nav_bar.dart';
import 'package:ticketapp/Login/login.dart';
import 'package:ticketapp/Models/accountObj.dart';
import 'package:ticketapp/http/request.dart';

class LoginController extends GetxController {
  var eye=true.obs;
  late final TextEditingController emailController;
  late final TextEditingController emaildkController;
  late final TextEditingController passwordController;
  late final TextEditingController passworddkController;
  late final TextEditingController passwordConfirmController;
  late AccountObj accountObj;
  @override
  void onInit() {
    // TODO: implement onInit
    emailController = TextEditingController();
    emaildkController = TextEditingController();
    passwordController = TextEditingController();
    passworddkController = TextEditingController();
    passwordConfirmController = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void apiRegister() async{
    Get.dialog(Center(child: CircularProgressIndicator()));
    var headers = {"Content-type": "application/json"};
    Request request=Request(Url:"https://qlbvxk.herokuapp.com/api/accounts/3",body:jsonEncode({
      "Email" : emaildkController.text,
      "MatKhau" : passworddkController.text
    }),header: headers);
    request.post().then((value){
      print(value.statusCode);


      if(value.statusCode==201){
        Get.back();
        emailController.text=emaildkController.text;
        Get.off(()=>Login());
        Get.snackbar("","Đăng ký thành công!",backgroundColor: Colors.blue);
      }
      else{
        Get.back();
        Timer timer = Timer(Duration(milliseconds: 1000), (){
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
                      ,                    Text("Tài khoản đã tồn tại",style:TextStyle(color:Color(0xff777777), fontSize: 20,))
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
    }
    ).catchError((e){

    });
  }

  void apiLogin() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    var headers = {"Content-type": "application/json"};
    Request request=Request(Url:"https://qlbvxk.herokuapp.com/api/accounts/validate/",body:jsonEncode({
      "Email" : emailController.text,
      "MatKhau" : passwordController.text
    }),header: headers);
    request.post().then((value) async {
      print(value.body);
      AccountObj accountObj =AccountObj.fromJson(json.decode(value.body));
      print(accountObj.maNd);
      if(accountObj.maNd>0){
        SharedPreferences prefs= await SharedPreferences.getInstance();
        prefs.setInt("VaiTro", accountObj.vaitro);
        this.accountObj=accountObj;
        print("Ma ${this.accountObj.maNd}");
        print("Ten ${this.accountObj.tenNd}");
        print("sdt ${this.accountObj.sdt}");
        print("Ngay sinh ${this.accountObj.ngaySinh}");
        print("Dia chi ${this.accountObj.diaChi}");
        print("cmnd ${this.accountObj.cmnd}");

        Get.back();
        passwordController.text="";

        Get.off(()=>BottomNavBar());
      }
      else{
        Get.back();
        Timer timer = Timer(Duration(milliseconds: 1000), (){
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
,                    Text("Thông tin đăng nhập sai",style:TextStyle(color:Color(0xff777777), fontSize: 20,))
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
    }
    ).catchError((e){
      print("loi");
    });
  }
  
}
