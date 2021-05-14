import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Controller/controller.dart';
import 'package:ticketapp/Models/ticketInforObj.dart';
import 'package:ticketapp/Notify/notify.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';

class DetailSearch extends StatelessWidget {
  late String nhaxe, noidi, noiden, giodi, gioden, day;
  late int giatien;
  Controller controllerDetail = Get.put(Controller());
  List<String> listcho = [];
  DetailSearch({
    required this.nhaxe,
    required this.noidi,
    required this.noiden,
    required this.giodi,
    required this.gioden,
    required this.giatien,
    required this.day,
    required this.listcho,
  });
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
            Text("Chi tiết vé xe", style: AppThemes.Text18Medium),
            SizedBox(
              width: 50,
            ),
          ],
        ),
        backgroundColor: AppColors.scaffold,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 50),
        child: Container(
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
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 30, right: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: AppColors.background,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(controllerDetail.inforAccount[0],
                            style: AppThemes.Text18),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: AppColors.background,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("(VN)+84: ${controllerDetail.inforAccount[1]}" ,
                            style: AppThemes.Text18),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.pending_actions_outlined,
                          color: AppColors.background,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Gọi mình trước 20 phút", style: AppThemes.Text18),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_city_rounded,
                          color: AppColors.background,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(noidi, style: AppThemes.Text18),
                        Icon(Icons.arrow_right_alt_sharp),
                        Icon(
                          Icons.location_city_rounded,
                          color: AppColors.background,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(noiden, style: AppThemes.Text18),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.view_day,
                          color: AppColors.background,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Ngày đi: " + "$day", style: AppThemes.Text18),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: AppColors.background,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Thời gian: ", style: AppThemes.Text18),
                        Text(
                          giodi,
                          style: AppThemes.Text18Medium,
                        ),
                        Icon(Icons.arrow_right_alt_sharp),
                        Text(
                          gioden,
                          style: AppThemes.Text18Medium,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.bus_alert,
                          color: AppColors.background,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Chỗ: ${listcho.join(" ")} ",
                          style: AppThemes.Text18,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.money,
                          color: AppColors.background,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Giá tiền: ",
                          style: AppThemes.Text18,
                        ),
                        Text(
                            "${giatien * controllerDetail.listSelected.length} đ",
                            style: AppThemes.Text18Medium),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:20,right:20,top: 30),
                child: Text("Bạn phải thanh toán trước 50% giá vé",
                    style: AppThemes.Text18),
              ),
              Padding(
                padding: const EdgeInsets.only(left:20,right:20,top: 30),
                child: Row(
                  children: [
                    Text("* Thanh toán trước:  ",
                        style: TextStyle(color: Colors.red, fontSize: 18)),
                    Container(
                      height: 30,
                      padding: EdgeInsets.only(left: 20,right: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.zero, right: Radius.zero)),
                      child: Center(
                        child: Text(  "${giatien * controllerDetail.listSelected.length*0.5} đ"),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
                child: RaisedButton(
                  onPressed: () {
                    controllerDetail.listTicketed.add(TicketInforObj(nhaxe,noidi,noiden, giodi, gioden, giatien, day,listcho));
                    for (var i = 0; i < controllerDetail.listChair.length; i++){
                      controllerDetail.listChair[i].colorChair= Colors.white;
                    }
                    controllerDetail.day.value="";
                    controllerDetail.listSelected.clear();


                 //   Navigator.push(context, MaterialPageRoute(builder: (context) =>Notify(),));

                  //  controllerDetail.listTicketed[0]

                    Get.off(()=>Notify());

                  },
                  color: AppColors.background,
                  child: Container(
                    width: 250,
                    height: 40,
                    child: Center(
                      child: Text(
                        "Đặt xe",
                        style: AppThemes.text18container,
                      ),
                    ),
                  ),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide:
                          BorderSide(color: AppColors.background, width: 1)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
