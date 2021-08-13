import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Controller/Chair_controller.dart';
import 'package:ticketapp/Home/bottom_nav_bar.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';

class Notify extends StatelessWidget {
  ChairController controllerNotify = Get.put(ChairController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 25),
            color: AppColors.background,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/8,
            child: Align(child: Text("Thông báo", style: AppThemes.text25container),
            alignment: Alignment.bottomCenter,),
          ),
          buildExpanded( context),
        ],
      ),
    );
  }

  Expanded buildExpanded(BuildContext context) => Expanded(child: Container(
    child: controllerNotify.listTicketed.length==0?ListView.builder(
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

    ):Center(child: Column(children: <Widget>[
      Icon(Icons.notifications, size: 30,color: Colors.lightBlueAccent,),
      Text("Bạn chưa có thông báo nào")
    ],),),
  ));
  void _thongbao1(){


  }
}
