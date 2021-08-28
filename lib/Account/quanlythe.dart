import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Account/account.dart';
import 'package:ticketapp/Account/chinhsach.dart';
import 'package:ticketapp/Account/tienich.dart';
import 'package:ticketapp/Controller/controller_theme.dart';
import 'package:ticketapp/Home/bottom_nav_bar.dart';
import 'package:ticketapp/Home/homePage.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';

class Quanlythe extends StatefulWidget {
  @override
  _QuanlytheState createState() => _QuanlytheState();
}

class _QuanlytheState extends State<Quanlythe> {
  ControllerTheme controllerTheme = Get.put(ControllerTheme());
  late bool ontap = false;

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
                // Navigator.push(context, CupertinoPageRoute(
                //   builder: (context) =>Account(),));
                Get.back();
              },
              child: Container(
                height: 50,
                width: 50,
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: AppColors.primary,
                ),
                decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            Text("Thông tin thêm", style: AppThemes.Text20Medium),
            SizedBox(
              width: 50,
            ),
          ],
        ),
        backgroundColor: AppColors.scaffold,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [

            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: chinhsach,
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.colors_icons,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadow.withOpacity(0.2),
                        blurRadius: 20,
                        offset: Offset(4, 10),
                      )
                    ]),
                child: Row(
                  children: [
                    Icon(
                      Icons.polymer,
                      color: AppColors.background,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Chính sách huỷ vé",
                      style: AppThemes.Text16,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: tienich,
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.colors_icons,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadow.withOpacity(0.2),
                        blurRadius: 20,
                        offset: Offset(4, 10),
                      )
                    ]),
                child: Row(
                  children: [
                    Icon(
                      Icons.integration_instructions_outlined,
                      color: AppColors.background,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Tiện ích",
                      style: AppThemes.Text16,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 50),
              child: RaisedButton(
                onPressed: () {
                  Get.back();
                },
                color: AppColors.background,
                child: Container(
                  width: 250,
                  height: 40,
                  child: Center(
                    child: Text(
                      "Lưu",
                      style: AppThemes.text18container,
                    ),
                  ),
                ),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide:
                        BorderSide(color: AppColors.background, width: 1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void chinhsach(){
Get.to(()=>Chinhsach());
  }
  void tienich(){
    Get.to(()=>Tienich());

  }
}
