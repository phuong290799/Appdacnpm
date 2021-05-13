
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';

class Dangky extends StatefulWidget {
  @override
  _DangkyState createState() => _DangkyState();
}

class _DangkyState extends State<Dangky> {
  late String user, pass;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: 50,
                width: 50,
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: AppColors.colors_icons,
                ),
                decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            Text("Đăng ký", style: AppThemes.Text20Medium),
            SizedBox(
              width: 50,
            ),
          ],
        ),
        backgroundColor: AppColors.scaffold,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColors.scaffold,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.background.withOpacity(0.3),
                            blurRadius: 10,
                            offset: Offset(4,8),
                          )
                        ]
                    ),
                    child:Row(
                      children: [
                        SizedBox(width: 30,),
                        Text(
                          "Chào bạn!",
                          style: AppThemes.text30container,
                        ),
                        SizedBox(width: 80,),
                        Icon(
                          Icons.directions_bus_rounded,
                          size: 100,
                          color: Colors.black,
                        ),

                      ],
                    )
                ),
              ),
              SizedBox(height: 120,),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: AppColors.scaffold,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          blurRadius:10,
                          offset: Offset(4, 8),
                          color: AppColors.shadow.withOpacity(0.2),
                        )
                      ]),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Nhập tài khoản: ...@gmail.com';
                            } else {
                              user = value;
                            }
                          },
                          style: AppThemes.Text14,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            labelText: "Tên đăng nhập: ",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.red, width: 2),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Nhập pass';
                            } else {
                              pass = value;
                            }
                          },
                          style: AppThemes.Text14,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_open),
                            labelText: "Mật khẩu: ",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.red, width: 2),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              RaisedButton(
                onPressed: () {
                  _dangky2();
                  // _controllerLogin.IsLogin = true;
                  // Get.to(HomePage());
                },
                color: AppColors.background,
                child: Container(
                  width: 250,
                  height: 40,
                  child: Center(
                    child: Text(
                      "Đăng nhập",
                      style: AppThemes.text18container,
                    ),
                  ),
                ),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide:
                    BorderSide(color: AppColors.background, width: 1)),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _dangky2() {
    if (formKey.currentState!.validate()) {
      signup(user, pass);
      Get.back();
    }
  }
  void signup(String user, String pass) {
  }

}