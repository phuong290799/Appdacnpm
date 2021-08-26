import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:ticketapp/Controller/Myticket_controller.dart';

import 'package:ticketapp/Models/myticket.dart';

import 'package:ticketapp/widget/MySeparator.dart';
import 'package:ticketapp/widget/bottomSheet.dart';

class MyticketInfor extends StatelessWidget {
  late MyTicket myticket;
  late int status;
  late int start=0;

  MyticketInfor(this.myticket, this.status);

  MyTicketController myTicketController = Get.put(MyTicketController());
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black, //Color(0xff969696),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildBill(context),
          SizedBox(height: 20),
          status == 1
              ? InkWell(
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    color: Colors.red,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      width: 350,
                      child: Center(
                        child: Text(
                          "Hủy vé",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Get.dialog(AlertDialog(
                      title: Text(
                        "Thông báo",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      content: Text("Tiền vé sẽ không được hoàn lại\nBạn có muốn hủy vé ?",
                          style: TextStyle(
                            color: Color(0xff777777),
                            fontSize: 20,
                          )),
                      actions: <Widget>[
                        FlatButton(
                            child: Text("Có",
                                style: TextStyle(
                                  color: Color(0xff777777),
                                  fontSize: 20,
                                )),
                            onPressed: () {
                              Get.back();
                              myTicketController.apiDelete(myticket);
                            }),
                        FlatButton(
                            child: Text("Không",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                )),
                            onPressed: () {
                              Get.back();
                            }),
                      ],
                    ));
                  },
                )
              :(status==2?InkWell(
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              color: Colors.red,
              child: Container(
                padding:
                EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                width: 350,
                child: Center(
                  child: Text(
                    "Đánh giá chuyến đi",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            onTap: () {
              buildShowModalBottomSheet(context,myTicketController.starReview,myTicketController.textReview,sentoReview(myticket.maVe));
            },
          ):Container()),
        ],
      ),
    );
  }

  Widget sentoReview(int MaVe){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(10))),
            color: Colors.black,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 15, vertical: 15),
              width: 250,
              child: Center(
                child: Text(
                  "Đánh giá",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          onTap: () {
            if(myTicketController.isReview==true){
              myTicketController.apiSenToReview(MaVe);
            }
            if(myTicketController.isReview==false){
              myTicketController.apiEditReview();
            }
          },
        ),
      ],);
  }


  Widget buildBill(BuildContext context) {
    return Container(
        height: 540,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          Positioned(
              top: 0,
              left: 24,
              right: 24,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                          child: Image(
                            image: AssetImage("assets/images/bus-icon.png"),
                          ),
                        ),
                        Text(
                          "VeXeTot",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: <Widget>[
                        Text(
                          "Bus Ticket",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    buildContainerInfoTicket("Tên", "Ngày                 ",
                        myticket.tenKh, setTime(myticket.ngayDi)),
                    SizedBox(height: 15),
                    buildContainerInfoTicket(
                        "Biển số",
                        "Ghế                   ",
                        myticket.bienSoXe,
                        myticket.maChoNgoi.toString()),
                    SizedBox(height: 15),
                    buildContainerInfoTicket("Mã vé xe", status!=3?"Đã Thanh toán":"",
                        myticket.maVe.toString(), status!=3?NumberFormat.simpleCurrency(locale: "vi").format(myticket.daThanhToan):""),
                    SizedBox(height: 15),
                    buildContainerInfoTicket(
                        "Bến xe",
                        "Giờ                    ",
                        getNameBusTrip(myticket.tenTuyenXe),
                        myticket.ngayDi.substring(11, 16)),
                    SizedBox(height: 25),
                    status == 1
                        ? Container(
                            height: 70,
                            child: Center(
                                child: Text(
                                    "${NumberFormat.simpleCurrency(
                                      locale: "vi",
                                    ).format(myticket.donGia)}",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold))))
                        : (status == 2
                            ? Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.red, width: 2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                margin: EdgeInsets.only(bottom: 10),
                                width: 200,
                                child: Center(
                                    child: Text("Vé đã đi",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold))))
                            : Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.red, width: 2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                margin: EdgeInsets.only(bottom: 10),
                                width: 200,
                                child: Center(
                                    child: Text("Vé đã hủy",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w800))))),
                    SizedBox(height: 20),


                    //buildContainerInfoTicket("Bui Thi Nga","24-12-2018"),
                  ],
                ),
              )),
          Positioned(
              top: 430,
              left: 5,
              right: 5,
              child: Container(
                child:Column(children: <Widget>[
                  Row(children: <Widget>[
                    buildContainerRadius(),
                    Expanded(child: const MySeparator(color: Color(0xffBDC4D3))),
                    buildContainerRadius()
                  ]),
                  InkWell(
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10))),
                      color: Colors.black,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        width: 150,
                        child: Center(
                          child: Text(
                            "Quay Lại",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Get.back();
                    },
                  )
                ],))),
        ]));
  }

  Container buildContainerInfoTicket(String titleOne, String titleTwo,
          String contentOne, String contentTwo) =>
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  titleOne,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 5),
                Container(
                  width: 150,
                  child:  Text(
                  contentOne,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),)

              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  titleTwo,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  contentTwo,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
      );

  Container buildContainerRadius() {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
          color: Colors.black, //Color(0xff969696),
          borderRadius: BorderRadius.all(Radius.circular(100))),
    );
  }

  setTime(String date) {
    return "${date.substring(8, 10)}-${date.substring(5, 7)}-${date.substring(0, 4)}";
  }

  getNameBusTrip(String nameBusTrip) {
    for (int i = 0; i < nameBusTrip.length; i++) {
      if (nameBusTrip[i] == "-") {
        return "Bx " + nameBusTrip.substring(7, i - 1);
      }
    }
  }
}
