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
  List<Widget> page = [vehientai(), vedadi(), vedahuy()];
  int indexPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width,
            color: AppColors.background,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 35,
                      width: 35,
                      child: Image(
                          image: AssetImage("assets/images/bus-icon.png")),
                    ),
                    Text(
                      "VeXeTot",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(height: 45),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Vé hiện tại",
                      style: indexPage == 0
                          ? AppThemes.text18container
                          : AppThemes.text18containerblack,
                    ),
                    Container(
                      color: Color(0xffe0e0e0),
                      width: 1,
                      height: 20,
                    ),
                    Text("Chuyến đã đi",
                        style: indexPage == 1
                            ? AppThemes.text18container
                            : AppThemes.text18containerblack),
                    Container(
                      color: Color(0xffe0e0e0),
                      width: 1,
                      height: 20,
                    ),
                    Text("Vé đã hủy",
                        style: indexPage == 2
                            ? AppThemes.text18container
                            : AppThemes.text18containerblack),
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
                  child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowGlow();
              return true;
            },
            child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    indexPage = value;
                  });
                },
                itemCount: page.length,
                itemBuilder: (context, index) {
                  return page[index];
                }),
          )))
        ],
      ),
    );
  }
}
