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
            Text("Quản lý thẻ", style: AppThemes.Text20Medium),
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
            Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      ontap = !ontap;
                    });
                  },
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
                          Icons.monetization_on_outlined,
                          color: AppColors.background,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Text(
                          "Ngân hàng liên kết",
                          style: AppThemes.Text16,
                        )),
                        ontap
                            ? Icon(
                                Icons.arrow_circle_down_sharp,
                                color: AppColors.background,
                              )
                            : Icon(
                                Icons.arrow_circle_up_sharp,
                                color: AppColors.background,
                              )
                      ],
                    ),
                  ),
                ),
                ontap
                    ? Container(
                        height: 4 * 57,
                        child: ListView(
                            padding: EdgeInsets.only(left:20,top: 3),
                            children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 2, 20, 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
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
                                Expanded(
                                    child: Text(
                                  "Agribank",
                                  style: AppThemes.Text16,
                                )),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset("assets/images/agribank.png",fit: BoxFit.cover,height: 50,width: 50,)),
                              ],
                            ),
                          ),
SizedBox(height: 3,),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 2, 20, 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                                    Expanded(
                                        child: Text(
                                          "Vietcombank",
                                          style: AppThemes.Text16,
                                        )),
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset("assets/images/vietcombank.jpg",fit: BoxFit.cover,height: 50,width: 50,)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 3,),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 2, 20, 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                                    Expanded(
                                        child: Text(
                                          "Techcombank",
                                          style: AppThemes.Text16,
                                        )),
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset("assets/images/techcombank.png",fit: BoxFit.cover,height: 50,width: 50,)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 3,),
                              Container(
                                height: 54,
                                padding: EdgeInsets.fromLTRB(20, 2, 30, 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                                    Expanded(
                                        child: Text(
                                          "Liên kết ngân hàng mới",
                                          style: AppThemes.Text16,
                                        )),
                                   Container(
                                     height: 30,
                                     width: 30,
                                     decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(100),
                                         border: Border.all(color: AppColors.background),
                                         color: AppColors.colors_icons,
                                        ),
                                     child: Center(
                                       child: Icon(Icons.add,color: AppColors.background,),
                                     ),
                                       ),
                                  ],
                                ),
                              ),
                        ]),
                      )
                    : Container(
                        height: 0,
                      ),
              ],
            ),
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
