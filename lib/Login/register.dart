import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ticketapp/Controller/Login_controller.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';

class Dangky extends StatefulWidget {
  @override
  _DangkyState createState() => _DangkyState();
}

class _DangkyState extends State<Dangky> {
  LoginController loginController = Get.put(LoginController());
  int statusInfo = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[buildLogo(context), buildLogin(context)],
    ));
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

  Expanded buildLogin(BuildContext context) {
    return Expanded(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10))),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(
                child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    statusInfo == 0
                        ? Center(
                            child: Text("Vui lòng nhập đầy đủ thông tin",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 17)))
                        : (statusInfo == 2
                            ? Center(
                                child: Text("Email chưa đúng định dạng",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 17)))
                            : statusInfo == 3
                                ? Center(
                                    child: Text("Mật khẩu không trùng khớp",
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 17)))
                                : Container()),
                    SizedBox(height: 25),
                    buildContainerInput(
                        "Email", loginController.emaildkController),
                    SizedBox(height: 25),
                    buildContainerInput(
                        "Mật khẩu", loginController.passworddkController),
                    SizedBox(height: 25),
                    buildContainerInput("Xác nhận mật khẩu",
                        loginController.passwordConfirmController),
                    SizedBox(height: 100),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: InkWell(
                        child: Center(
                          child: Text("Đăng ký",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                        onTap: () {
                          _dangky2();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ))));
  }

  Container buildContainerInput(
      String title, TextEditingController controller) {
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title,
          style: TextStyle(
              fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold)),
      SizedBox(height: 5),
      TextField(
        obscureText: title != "Email" ? loginController.eye.value : false,
        controller: controller,
        style: AppThemes.Text18,
        keyboardType:
            title == "Email" ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          suffixIcon: title != "Email"
              ? InkWell(
                  child: Icon(
                      loginController.eye.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility,
                      size: 18),
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    loginController.eye.value = !loginController.eye.value;
                  },
                )
              : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    ]));
  }

  void _dangky2() {
    if (!loginController.emaildkController.text.contains("@gmail.com")) {
      setState(() {
        statusInfo = 2;
      });
    } else {
      if (!loginController.passworddkController.text.isEmpty &&
          !loginController.passwordConfirmController.text.isEmpty) {
        if (loginController.passworddkController.text ==
            loginController.passwordConfirmController.text) {
          setState(() {
            statusInfo = 1;
          });
          loginController.apiRegister();
        } else {
          setState(() {
            statusInfo = 3;
          });
        }
      } else {
        setState(() {
          statusInfo = 0;
        });
      }
    }
  }
}
