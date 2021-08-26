import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:ticketapp/Controller/Login_controller.dart';
import 'package:ticketapp/Home/bottom_nav_bar.dart';

import 'package:ticketapp/Login/register.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginController loginController = Get.put(LoginController());
  late String user, pass;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light));
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        child: Column(
          children: <Widget>[
            buildLogo(context),
            // SizedBox(height: 50),
            buildLogin(context)
          ],
        ),
      ),
    );
  }

  Expanded buildLogin(BuildContext context) {
    return Expanded(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(
                child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Column(
                  children: <Widget>[
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: loginController.emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Nhập tài khoản: ...@gmail.com';
                              } else {
                                user = value;
                              }
                            },
                            style: AppThemes.Text18,
                            textCapitalization: TextCapitalization.sentences,
                            decoration: InputDecoration(
                              labelText: "Tên đăng nhập ",
                              labelStyle: TextStyle(color: Colors.grey,fontSize: 17, fontWeight: FontWeight.w500),
                              prefixIcon: Icon(Icons.supervised_user_circle),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Obx(() => TextFormField(
                            style: AppThemes.Text18,
                            textInputAction: TextInputAction.send,
                                

                                controller: loginController.passwordController,
                                obscureText: loginController.eye.value,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Nhập pass';
                                  } else {
                                    pass = value;
                                  }
                                },
                                decoration: InputDecoration(
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      loginController.eye.value =
                                          !loginController.eye.value;
                                    },
                                    child: Icon(loginController.eye.value
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility,size: 18,),
                                  ),
                                  prefixIcon: Icon(Icons.lock_open),
                                  labelText: "Mật khẩu ",
                                  labelStyle: TextStyle(color: Colors.grey,fontSize: 17, fontWeight: FontWeight.w500),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.red, width: 2),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: InkWell(
                        child: Center(
                          child: Text("Đăng nhập",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                        onTap: () {
                          //Get.off(()=>BottomNavBar());
                          loginController.apiLogin();
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    ),
                    SizedBox(height: 100),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        Text("Bạn chưa có tài khoản?", style: TextStyle(color: Colors.black,fontSize: 15)),
                          SizedBox(width: 5),
                          InkWell(child: Text("Đăng ký",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 15)),
                          onTap: (){
                            Get.to(Dangky());
                          },)
                      ],),
                    ),
                  ],
                ),
              ),
            ))));
  }

  Container buildLogo(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(color: AppColors.background),
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 30,
                  width: 30,
                  child: Image(image: AssetImage("assets/images/bus-icon.png")),
                ),
                Text(
                  "VeXeTot",
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            SizedBox(height: 33),
            Text("Xin Chào",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(height: 5),
            Text("Đăng nhập để tận hưởng những chuyến đi ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white)),
            SizedBox(height: 25),
            Center(
              child: Container(
                //  color: Colors.red,
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                        left: 20,
                        top: 0,
                        child: Container(
                          height: 80,
                          child: Image(
                              image: AssetImage("assets/images/onibus.png")),
                        )),
                    Positioned(
                        right: 30,
                        top: 0,
                        child: Container(
                          height: 80,
                          child:
                              Image(image: AssetImage("assets/images/bus.png")),
                        ))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
