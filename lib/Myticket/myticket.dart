import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Myticket/vedadi.dart';
import 'package:ticketapp/Myticket/vedahuy.dart';
import 'package:ticketapp/Myticket/vehientai.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';

class Myticket extends StatefulWidget {
  @override
  _MyticketState createState() => _MyticketState();
}

class _MyticketState extends State<Myticket> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
                    color: AppColors.primary,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              Text("Vé của tôi", style: AppThemes.Text20Medium),
              SizedBox(
                width: 50,
              ),
            ],
          ),
          backgroundColor: AppColors.scaffold,
    bottom: TabBar(
        tabs: [
          Tab(
              child: Text(
                "Vé hiện tại",
                style: AppThemes.Text14Medium
              )),

          Tab(

              child: Text(
                "Vé đã đi",
                  style: AppThemes.Text14Medium
              )),
          Tab(

              child: Text(
                "Vé đã huỷ",
                  style: AppThemes.Text14Medium
              ))
        ],
      ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,

          child:TabBarView(
            children: [
              vehientai(),
              vedadi(),
              vedahuy(),


            ],
          ),
        ),
      ),
    );
  }
}
