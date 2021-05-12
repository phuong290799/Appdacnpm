import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Home/bottom_nav_bar.dart';
import 'package:ticketapp/Home/bottomnav.dart';
import 'package:ticketapp/Home/homePage.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';

class Notify extends StatefulWidget {
  @override
  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
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
               Get.to(()=>BottomNavBar());
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
            Text("Thông báo", style: AppThemes.Text20Medium),
            SizedBox(
              width: 50,
            ),
          ],
        ),
        backgroundColor: AppColors.scaffold,

      ),

      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start ,
                children: [
                  Row
                    (
                    children: [
                      TextButton(
                        child: Text(
                          "Bạn đã mua vé ngày 29/3/2021",style: AppThemes.Text18
                        ),
                        onPressed: _thongbao1,
                      ),

                    ],
                  ),


                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _thongbao1(){


  }
}
