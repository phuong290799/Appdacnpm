import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Controller/controller.dart';
import 'package:ticketapp/Home/bottom_nav_bar.dart';
import 'package:ticketapp/Home/homePage.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';

class Notify extends StatelessWidget {
  Controller controllerNotify = Get.find();
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

      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Container(
          padding: const EdgeInsets.all(5),
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

          child: Container(
            height: MediaQuery.of(context).size.height-190,
            child: ListView.builder(
              itemCount: controllerNotify.listTicketed.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  padding: EdgeInsets.all(20),
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
                      Icon(Icons.check_box_outlined),
                      SizedBox(width: 10,),
                      Flexible(
                        child: Text(
                            "Bạn đã mua vé ngày ${controllerNotify.listTicketed[index].day}",style: AppThemes.Text18
                        ),
                      ),
                    ],
                  ),
                );
              },

            ),
          ),
        ),
      ),
    );
  }
  void _thongbao1(){


  }
}
