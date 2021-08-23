import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ticketapp/Controller/Chair_controller.dart';
import 'package:ticketapp/Home/bookSeat.dart';
import 'package:ticketapp/Models/ticketObj.dart';

import 'package:ticketapp/Theme/colors.dart';



class SelectChair extends GetView<ChairController> {

  late TicketObj obj;
  late String day;
  ChairController controllerChair = Get.put(ChairController());
  SelectChair(this.obj, this.day);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    /*controllerChair.obj=this.obj;
    controllerChair.Time=this.day;*/
   /* controllerChair.Time=day;
    controllerChair.obj=obj;*/
    print("render");
    //controllerChair.apiGetListSeatEmpty(obj, day);
    return Scaffold(
      body: Column(
        children: <Widget>[
          buildContainerAppBar(context),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            color: Color(0xffeaf4ff),
            child: Text(
              "VeXeTot cam kết giữ đúng vị trí bạn đã chọn",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 20),
          Obx(()=>controllerChair.statusLoad.value?buildExpandedSeclectTicket(context):Center(child: CircularProgressIndicator()),),

        ],
      ),
    );
  }

  Expanded buildExpandedSeclectTicket(BuildContext context) {
    return Expanded(
        child: Obx(()=>Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  buildSeat(1,-1),
                  SizedBox(width: 4),
                  Text(
                    "Trống",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff6d6d6d)),
                  ),
                  Expanded(child: Container()),
                  buildSeat(2,-1),
                  SizedBox(width: 4),
                  Text(
                    "Ghế Không bán",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff6d6d6d)),
                  ),
                  Expanded(child: Container()),
                  buildSeat(3,-1),
                  SizedBox(width: 4),
                  Text(
                    "Đang chọn",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff6d6d6d)),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.info_outline,size: 20,color: Colors.grey,),
                    SizedBox(width: 5,),
                    Text(
                      "Nhấn vào giường để chọn",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff828282)),
                    ),

                  ]),
              SizedBox(height: 30),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "Tầng 1",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Text(
                      "Tầng ${controllerChair.ListSeat.length-34}",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),

                  ]),
              SizedBox(height: 30),
              StatefulBuilder(builder: (BuildContext context, StateSetter setState){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[

                    Container(
                      width: MediaQuery.of(context).size.width/3,
                      height: MediaQuery.of(context).size.height*0.4,
                      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                          itemCount:18,
                          itemBuilder: (context, index){
                            int stt=controllerChair.ListSeat[index];
                            return InkWell(child: buildSeat(stt,index),
                              onTap: (){
                                if(controllerChair.ListSeat[index]==1){
                                  controllerChair.ListSeat[index]=3;
                                  controllerChair.ListSeatBook.add(index);

                                }
                                else
                                if(controllerChair.ListSeat[index]==3)
                                {
                                  controllerChair.ListSeatBook.remove(index);
                                  controllerChair.ListSeat[index]=1;
                                }

                              },);
                          }),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/3,
                      height: MediaQuery.of(context).size.height*0.4,
                      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                          itemCount: 18,
                          itemBuilder: (context, index){
                            int stt=controllerChair.ListSeat[index+18];
                            return InkWell(child: buildSeat(stt,index+18),
                              onTap: (){
                                if(controllerChair.ListSeat[index+18]==1){
                                  controllerChair.ListSeatBook.add(index+18);
                                  controllerChair.ListSeat[index+18]=3;
                                }
                                else
                                if(controllerChair.ListSeat[index+18]==3)
                                {
                                  controllerChair.ListSeatBook.remove(index+18);
                                  controllerChair.ListSeat[index+18]=1;
                                }
                              },);
                          }),
                    ),
                  ],
                );
              }),
              Text("Số vé ${controllerChair.ListSeatBook.length}"),
              SizedBox(height: 70),
              InkWell(child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                color: Colors.black,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  width: MediaQuery.of(context).size.width/2,
                  child: Center(child: Text("Xác nhận chọn ghế",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.white),),
                  ),),),onTap: (){
                if(controllerChair.ListSeatBook.isEmpty){
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
                  Get.to(()=>BookSeat(obj,controllerChair.ListSeatBook,day
                  ));
                }

              },)


            ],
          ),
        )));
  }

  Container buildSeat(int MaMau, int sst) {
    return Container(
        height: 20,
        width: 20,
        child:sst>=0?Center(child: Text("${sst}",style: TextStyle(fontWeight: FontWeight.w900,color: MaMau==2?Colors.white:Colors.black),)):Container(),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            color: MaMau == 1
                ? Colors.white
                : (MaMau == 2 ? Colors.grey : Colors.lightGreenAccent)));
  }

  Container buildContainerAppBar(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 40, bottom: 10),
      color: AppColors.background,
      child: Column(
        children: <Widget>[
          Text("${obj.diaChiBxDi}",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Colors.white)),
          SizedBox(height: 5),
          Text("${obj.diaChiBxDen}",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Colors.white)),
          SizedBox(height: 20),
          Text(setTime(),
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Colors.white))
        ],
      ),
    );
  }

  String setTime() {
    return "${obj.gioXuatBen.substring(0, 5)} ${day.substring(0, 2)}/${day.substring(3, 5)}/${day.substring(6, 10)}";
  }
}
