import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Account/fixAccount.dart';
import 'package:ticketapp/Account/gopy.dart';
import 'package:ticketapp/Account/quanlythe.dart';
import 'package:ticketapp/Account/setting.dart';
import 'package:ticketapp/Home/bottom_nav_bar.dart';
import 'package:ticketapp/Home/homePage.dart';
import 'package:ticketapp/Login/login.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
            padding: EdgeInsets.only(right: 15, left: 20, top: 45),
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 6,
            color: AppColors.background,
            child: InkWell(
              child: Row(
                children: [
                  CircleAvatar(
                    maxRadius: 30,
                    backgroundColor: Color(0xfff4f4f4),
                    child: Icon(
                      Icons.person,
                      size: 45,
                      color: Color(0xff92c7fc),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 200,
                    child: Text(
                        "Trở thành thành viên để tận hưởng những chuyến đi ",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                  Expanded(child: SizedBox()),
                  Icon(Icons.arrow_forward_ios_outlined,
                      color: Colors.white, size: 22),
                ],
              ),
              onTap: () {
                _fix();
              },
            )),
        SizedBox(
          height: 50,
        ),
        buildExpanded()
      ],
    ));
  }

  Expanded buildExpanded() {
    return Expanded(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10),
          InkWell(
            child: buildRow(
              "Cài đặt",
              "Lưu thẻ và thanh toán với 1 chạm",
              Icon(
                Icons.settings,
                size: 30,
                color: Colors.grey,
              ),
            ),
            onTap: () {
              _thietlap();
            },
          ),
          SizedBox(height: 25),
          Container(
            color: Color(0xffe5e5e5),
            height: 1,
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(height: 25),
          InkWell(
            child: buildRow(
              "Góp ý",
              "",
              Icon(
                Icons.mail_outline,
                size: 30,
                color: Colors.grey,
              ),
            ),
            onTap: () {
              _gopy();
            },
          ),

          SizedBox(height: 25),
          Container(
            color: Color(0xffe5e5e5),
            height: 1,
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(height: 25),
          InkWell(
            child: buildRow(
              "Thông tin thêm",
              "Lưu thẻ và thanh toán với 1 chạm",
              Icon(
                Icons.info_outline,
                size: 30,
                color: Colors.grey,
              ),
            ),
            onTap: () {
              _quanly();
            },
          ),
          SizedBox(height: 200),
         InkWell(child:  Center(child: Container(
             height: 50,
             width: 200,
             decoration: BoxDecoration(color:AppColors.background, borderRadius: BorderRadius.all(Radius.circular(10))),
             child:Center(child: Text("Đăng xuất", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold))))),
         onTap: (){
           Get.offAll(()=>Login());
         },)
        ],
      ),
    ));
  }

  Row buildRow(String title, String detail, Icon s) {
    return Row(
      children: <Widget>[
        s,
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: TextStyle(color: Colors.black, fontSize: 20)),
           SizedBox(height: 10),
            Text(detail, style: TextStyle(color: Colors.grey, fontSize: 15)),
          ],
        )
      ],
    );
  }

  void _fix() {
    Get.to(()=>FixAccount());
    // Get.to(() => FixAccount());
  }

  void _quanly() {
    Get.to(() => Quanlythe());
  }

  void _thietlap() {
    // Navigator.push(context, MaterialPageRoute(builder: (context) => Setting(),));
    Get.to(() => Setting());
  }

  void _gopy() {
    Get.to(() => Gopy());
  }

  void _danhgia() {}

  void _signout() {
    Get.offAll(() => Login());
  }
}
