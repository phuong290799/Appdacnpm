import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ticketapp/Home/homePage.dart';
import 'package:ticketapp/Models/myticket.dart';
import 'package:ticketapp/Models/ticketObj.dart';
import 'package:ticketapp/widget/MySeparator.dart';

import 'bottom_nav_bar.dart';

class Ticket extends StatelessWidget {
  List<MyTicket> listTicket;
  late String amount;
  Ticket(this.listTicket,this.amount);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,//Color(0xff969696),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildBill(context),
        ],
      ),
    );
  }

  Widget buildBill(BuildContext context) {
    return Container(
        height: 550,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          Positioned(
              top: 0,
              left: 24,
              right: 24,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          height: 25,
                          width: 25,
                          child:
                          Image(image: AssetImage("assets/images/bus-icon.png"),),
                        ),
                        Text(
                          "VeXeTot",
                          style: TextStyle(fontStyle: FontStyle.italic,
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(children: <Widget>[Text("Bus Ticket",style:  TextStyle(fontStyle: FontStyle.italic,
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),)],),
                    SizedBox(height: 20),
                    buildContainerInfoTicket("Tên","Ngày                 ",listTicket[0].tenKh,setTime(listTicket[0].ngayDi)),
                    SizedBox(height: 15),
                    buildContainerInfoTicket("Biển số","Ghế                   ",listTicket[0].bienSoXe,"${getSeat()}"),
                    SizedBox(height: 15),
                    buildContainerInfoTicket("Mã vé xe","Đã Thanh toán",listTicket[0].maVe.toString(),NumberFormat.simpleCurrency(locale: "vi").format(listTicket[0].daThanhToan*listTicket.length)),
                    SizedBox(height: 15),
                    buildContainerInfoTicket(
                        "Bến xe", "Giờ                    ", getNameBusTrip(listTicket[0].tenTuyenXe), listTicket[0].ngayDi.substring(11,16)),
                    SizedBox(height: 25),
                    Container(
                        height: 70,
                        child:Center(child:  Text("${NumberFormat.simpleCurrency(locale: "vi",).format(listTicket[0].donGia*listTicket.length)}",style: TextStyle(color: Colors.red, fontSize: 30,fontWeight: FontWeight.bold)))

                    ),
                    SizedBox(height: 20),



                    //buildContainerInfoTicket("Bui Thi Nga","24-12-2018"),
                  ],
                ),
              )),
          Positioned(
              top: 420,
              left: 5,
              right: 5,
              child: Container(
                  child: Column(
                    children: <Widget>[
                      Row(children: <Widget>[
                        buildContainerRadius(),
                        Expanded(
                            child: const MySeparator(
                                color: Color(0xffBDC4D3))),
                        buildContainerRadius()
                      ]),
                      InkWell(child:  Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                        color: Colors.black,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                          width: 150,
                          child: Center(child: Text("Màn Hình Chính",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.white),),
                          ),),),
                        onTap: (){
                          Get.offAll(()=> BottomNavBar());
                        },)
                    ],
                  ))),
        ]));
  }

  Container buildContainerInfoTicket(String titleOne, String titleTwo,String contentOne, String contentTwo) => Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child:Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Text(titleOne,style:  TextStyle(
              fontSize: 20,
              color: Colors.grey,
              fontWeight: FontWeight.w600),),
          SizedBox(height: 5),
          Container(child: Text(contentOne,style:  TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w600),),
          width: 150,)
        ],),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(titleTwo,style:  TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontWeight: FontWeight.w600),),
            Text(contentTwo,style:  TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w600),),
          ],)


    ],),);

  Container buildContainerRadius() {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
          color: Colors.black,//Color(0xff969696),
          borderRadius: BorderRadius.all(Radius.circular(100))),
    );
  }
  getNameBusTrip(String nameBusTrip){
    for(int i=0; i<nameBusTrip.length; i++){
      if(nameBusTrip[i]=="-"){
        return "Bx "+nameBusTrip.substring(7,i-1);
      }
    }
  }
  setTime(String date){
    return "${date.substring(8,10)}-${date.substring(5,7)}-${date.substring(0,4)}";
  }
  getSeat(){
    String numberSeat="";
    for(int i=0; i<listTicket.length; i++){
      if(i!=listTicket.length-1){
        numberSeat=numberSeat+listTicket[i].maChoNgoi.toString()+"-";
      }
      else
        {
          numberSeat=numberSeat+listTicket[i].maChoNgoi.toString();
        }

    }
    return numberSeat;
  }
}
