import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ticketapp/Controller/Chair_controller.dart';
import 'package:ticketapp/Controller/Home_controller.dart';
import 'package:ticketapp/Home/selectChair.dart';
import 'package:ticketapp/Models/ticketObj.dart';
import 'package:ticketapp/Theme/colors.dart';

class KetquaSearch extends StatelessWidget {
  String noidi, noiden, day;
  KetquaSearch({required this.noidi, required this.noiden, required this.day});
  HomeController controllersearch = Get.put(HomeController());
  @override
  String time(String time) {
    return time.substring(0,5);
  }

  String times(String time1, String time2) {
    DateTime s1 = DateTime.parse(time1);
    DateTime s2 = DateTime.parse(time2);
    var t = s2.difference(s1);
    time1 = t.toString().substring(0, 5);
    return time1.substring(0, 2) + " Giờ " + time1.substring(3, 4) + " Phút";
  }

  String setDate() {
    print(this.day);
    String day = this.day.substring(0, 2);
    String month = this.day.substring(3, 5);
    String year = this.day.substring(6, 10);
    DateTime dateTime =
        DateTime(int.parse(year), int.parse(month), int.parse(day));
    print("${dateTime.weekday}");
    print("$day/$month/$year");
    if (dateTime.weekday == 7) {
      return "CN, $day/$month/$year";
    } else {
      return "Thứ ${dateTime.weekday + 1}, $day/$month/$year";
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildContainerAppBar(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Text("Liên hệ nhà xe",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
          ),
          buildExpandedListTiket()
        ],
      ),
    );
  }

  Expanded buildExpandedListTiket() {
    return Expanded(
        child: Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowGlow();
            return true;
          },
          child: ListView.builder(
              itemCount: controllersearch.listsearch.length,
              itemBuilder: (context, index) {
                TicketObj obj=controllersearch.listsearch[index];
                return InkWell(child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    elevation: 5,
                    child: Container(
                      child: buildColumnTicket(obj),

                    )),
                onTap: (){

                  Get.to(()=> SelectChair(obj, day));

                });
              })),
    ));
  }

  Column buildColumnTicket(TicketObj obj) {
    return Column(children: <Widget>[
      Container(
        color: Color(0xffd3e9ff),
        child: Row(children: <Widget>[
        Container(
          child: Icon(Icons.sticky_note_2_outlined,color: Colors.white,),
          height: 35,width: 50,
          decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),color: Colors.blueAccent),),
          SizedBox(width:10),
          Text("Yêu cầu thanh toán trước 50%",style: TextStyle(color: Colors.blueAccent, fontSize: 20,fontWeight: FontWeight.w400))
      ],),),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("${time(obj.gioXuatBen)}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold)),
              SizedBox(width: 5),
              Icon(Icons.album, color: Colors.blue, size: 18),
              Container(height: 1, width: 40, color: Colors.black12),
              Text("${obj.thoiGianDiChuyen*24} giờ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w400)),
              Container(height: 1, width: 40, color: Colors.black12),
              Icon(Icons.album, color: Colors.red, size: 18),
              SizedBox(width: 5),
              Text("${time(obj.gioXuatBen)}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold)),
            ],
          )),

      Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: <Widget>[
              Text("${obj.tenBxDi}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              Text("${obj.tenBxDen}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          )),
      SizedBox(height: 15),
      Container(height: 1, color: Colors.black12),
      SizedBox(height: 15),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        //color: Colors.red,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CircleAvatar(
                  maxRadius: 30,
                  backgroundImage: AssetImage("assets/images/khach2.png")),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("${obj.tenNhaXe}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("Ghế chỗ ${obj.soChoNgoi} chỗ",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                ],
              ),
              Expanded(child: Container()),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("3.0",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      SizedBox(width: 5),
                      Icon(Icons.star, color: Colors.amber, size: 25)
                    ],
                  )
                ],
              )
            ]),
      ),
      SizedBox(height: 15),
      Container(height: 1, color: Colors.black12),
      Container(
        height: 70,
       child:Center(child:  Text("${NumberFormat.simpleCurrency(locale: "vi",).format(obj.donGia)}",style: TextStyle(color: Colors.red, fontSize: 30,fontWeight: FontWeight.bold)))

      )
    ]);
  }

  Container buildContainerAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      color: AppColors.background,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("$noidi",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(width: 10),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 25,
              ),
              SizedBox(width: 10),
              Text("$noiden",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          ),
          SizedBox(height: 5),
          Text("${setDate()}",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Colors.white))
        ],
      ),
    );
  }
}
