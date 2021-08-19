import 'dart:async';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ticketapp/Controller/Chair_controller.dart';
import 'package:ticketapp/Controller/Login_controller.dart';
import 'package:ticketapp/Home/Ticket.dart';
import 'package:ticketapp/Models/ticketObj.dart';

class BookSeat extends StatelessWidget {
  late TicketObj obj;
  int selectPay=0;
  int save=0;
  BookSeat(this.obj);


  ChairController controller = Get.put(ChairController());
  LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: Color(0xffd8d8d8),
      body: Column(
        children: <Widget>[
          buildContainerAppBar(),
          Expanded(
              child: Container(
            child: PageView(
              children: [buildPageOne(), buildPageTwo()],
            ),
          )),
        ],
      ),
    );
  }

  Widget buildPageTwo() {
    return StatefulBuilder(builder: (BuildContext context,StateSetter setState){
      return  Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(color: Color(0xffe8e8e8),border: Border.all(color: Colors.black12,width: 1)),
              padding: EdgeInsets.symmetric(vertical: 30,horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Text("Chọn hình thức thanh toán của bạn",style:TextStyle(fontStyle: FontStyle.italic,color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 18)),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        child: Card(child: Container(
                            decoration: BoxDecoration(color: selectPay==1?Colors.blue:Color(0xfff9f9f9),border: Border.all(color: Colors.black12,width: 2),borderRadius: BorderRadius.all(Radius.circular(5))),

                            height: 50,
                            width: 100,
                            child: Center(child: Icon(Icons.add_circle,color: selectPay==1?Colors.white:Colors.grey,size: 30,))
                        ),
                          elevation: 2,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),),
                        onTap: (){
                          setState((){
                            selectPay=1;
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        child: Card(child: Container(
                            decoration: BoxDecoration(color: selectPay==2?Colors.blue:Color(0xfff9f9f9),border: Border.all(color: Colors.black12,width: 2),borderRadius: BorderRadius.all(Radius.circular(5))),
                            height: 50,
                            width: 100,
                            child: Center(child: Text("PayPal",style: TextStyle(fontStyle: FontStyle.italic,color: selectPay==2?Colors.white:Colors.grey,fontWeight: FontWeight.w800,fontSize: 25),))
                        ),
                          elevation: 2,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),),
                        onTap: (){
                          setState((){
                            selectPay=2;
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            selectPay==1?Expanded(child: Container(
              padding: EdgeInsets.only(right: 15, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Nhập thông tin thẻ",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 30),
                  Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: Colors.black12),
                          color: Color(0xfffcfcfc),
                        ),
                        padding: EdgeInsets.only(right: 15, left: 15, top: 5, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Họ Tên",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 5),
                            Container(
                              //color: Colors.red,
                                child: Center(
                                  child: TextField(
                                    controller: controller.Name,
                                    textCapitalization: TextCapitalization.characters,
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                    keyboardType: TextInputType.name,
                                    onTap: () {
                                      // print(MediaQuery.of(context).viewPadding.bottom);
                                    },
                                    cursorHeight: 20,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      )),
                  SizedBox(height: 20),
                  Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: Colors.black12,width: 1),
                          color: Color(0xffe8e8e8),
                        ),
                        padding: EdgeInsets.only(right: 15, left: 15, top: 5, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Số thẻ",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 5),
                            Container(
                              //color: Colors.red,
                                child: Center(
                                  child: TextField(
                                    controller: controller.cardNumberController,
                                    textCapitalization: TextCapitalization.characters,
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                    keyboardType: TextInputType.number,
                                    onTap: () {
                                      // print(MediaQuery.of(context).viewPadding.bottom);
                                    },
                                    cursorHeight: 20,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      )),
                  SizedBox(height: 20),
                  Container(child:Row(
                    children: <Widget>[

                      Expanded(child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5))),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: Colors.black12,width: 1),
                              color: Color(0xfffcfcfc),
                            ),
                            padding: EdgeInsets.only(right: 15, left: 15, top: 5, bottom: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "MM/YY",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  //color: Colors.red,
                                    child: Center(
                                      child: TextField(
                                        controller: controller.expDateController,
                                        textCapitalization: TextCapitalization.characters,
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                        keyboardType: TextInputType.datetime,
                                        onTap: () {
                                          // print(MediaQuery.of(context).viewPadding.bottom);
                                        },
                                        cursorHeight: 20,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          )),),
                      Expanded(child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5))),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: Colors.black12,width: 1),
                              color: Color(0xfffcfcfc),
                            ),
                            padding: EdgeInsets.only(right: 15, left: 15, top: 5, bottom: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "CVC",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  //color: Colors.red,
                                    child: Center(
                                      child: TextField(
                                        controller: controller.cVCController,
                                        textCapitalization: TextCapitalization.characters,
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                        keyboardType: TextInputType.number,
                                        onTap: () {
                                          // print(MediaQuery.of(context).viewPadding.bottom);
                                        },
                                        cursorHeight: 20,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          )),),

                    ],) ,
                    ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    Text(
                      " Lưu thông tin thẻ của bạn",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    InkWell(child:Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(border:Border.all(width: 3,color: Colors.black12),color: save==1?Colors.blue:Colors.white,borderRadius: BorderRadius.all(Radius.circular(100))),

                    ),
                    onTap: (){
                      setState((){
                        if(save==1){
                          save=0;
                        }
                        else
                          {
                            save=1;
                          }
                      });
                    },),

                  ],),
                  SizedBox(height: 30),
                  Center(child:  buildConfirm(context),)

                ],
              ),
            )):Container(),

          ],
        ),
      );
    });
  }

  Widget buildConfirm(BuildContext context){
    return InkWell(child: Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      color: Colors.black,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        width: 250,
        child: Center(child: Text("Xác nhận thanh toán",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.white),),
        ),),),onTap: (){
      controller.payViaNewCard();
//print("${controller.expDateController.text.substring(0,2)}");
      /*if(controllerChair.ListSeatBook.isEmpty){
        Timer timer = Timer(Duration(milliseconds: 1000), (){
          Get.back();
        });
        Get.dialog(
            AlertDialog(
                content: Container(
                  height: 80,
                  //color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Thông báo",style:TextStyle(color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Container(
                        height: 1,
                        color: Color(0xffcecece),
                      ),
                      SizedBox(height: 20),
                      Text("Bạn chưa chọn ghế nào",style:TextStyle(color:Color(0xff777777), fontSize: 20,))
                    ],
                  ),
                )
            )
        ).then((value){
          if (timer.isActive) {
            timer.cancel();
          }
        });
      }
      else{
        Get.to(()=>BookSeat(obj));
      }*/

    });
  }
  Container buildPageOne() {
    return Container(
      child: ListView(
        children: <Widget>[
          //SizedBox(height: 10),
          buildContainerItem("Bến xe đi", "${obj.diaChiBxDi}"),
          SizedBox(height: 10),
          buildContainerItem("Bến xe đến", "${obj.diaChiBxDen}"),
          SizedBox(height: 10),
          buildContainerItem("Giờ xuất bến", "${obj.gioXuatBen}"),
          SizedBox(height: 10),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(child:  buildExpandedNote(),
                ),
                Expanded(child:   buildExpandedAmount()),
              ],),
          ),
          SizedBox(height: 10),
          buildContainerItem("Giá tiền",
              "${NumberFormat.simpleCurrency(locale: "vi").format(obj.donGia * controller.ListSeatBook.length)}"),



        ],
      ),
    );
  }

  Widget buildExpandedAmount() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(18))),
      child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: Colors.grey),
              color: Color(0xfffcfcfc),
            ),
            padding: EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Thanh toán trước 30% giá vé ",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                Container(
                  //color: Colors.red,
                    child: Center(
                      child: TextField(
                        maxLines: 3,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                        keyboardType: TextInputType.number,
                        controller: controller.amount,
                        inputFormatters: [
                          CurrencyTextInputFormatter(
                              decimalDigits: 0,
                              locale: 'vi',
                              name: 'VND')
                        ],
                        onTap: () {
                          // print(MediaQuery.of(context).viewPadding.bottom);
                        },
                        cursorHeight: 20,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ))
              ],
            ),
          )),
    );
  }

  Widget buildExpandedNote() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(18))),
      child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: Colors.grey),
              color: Color(0xfffcfcfc),
            ),
            padding: EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Ghi chú: ",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                Container(
                  width: 200,
                    //color: Colors.red,
                    child: Center(
                  child: TextField(
                    //maxLength: 100,
                    maxLines: 4,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                    keyboardType: TextInputType.text,
                    controller: controller.Note,
                    onTap: () {
                      // print(MediaQuery.of(context).viewPadding.bottom);
                    },
                    cursorHeight: 20,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ))
              ],
            ),
          )),
    );
  }

  String GetAmount() {
    String amount = "";
    if (controller.amount.text != "0") {
      for (int i = 0; i < controller.amount.text.length - 3; i++) {
        if (controller.amount.text[i] != ".") {
          amount = amount + controller.amount.text[i];
        }
      }
      return amount;
    } else
      return "0";
  }

  Widget buildContainerItem(String title, String content) {
    return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: Colors.grey),
            color: Color(0xfffcfcfc),
          ),
          padding: EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Container(
                child: Text(
                  content,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                width: 360,
              )
            ],
          ),
        ));
  }

  Widget buildContainerAppBar() {
    return Container(
      color: Colors.blueAccent,
      padding: EdgeInsets.only(top: 40, bottom: 15),
      child: Center(
        child: Text(
          "Xác nhận thanh toán",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
