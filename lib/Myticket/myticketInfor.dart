import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ticketapp/Controller/Chair_controller.dart';
import 'package:ticketapp/Controller/Myticket_controller.dart';
import 'package:ticketapp/Models/SeatInfor.dart';
import 'package:ticketapp/Models/myticket.dart';
import 'package:ticketapp/Myticket/myticket.dart';
import 'package:ticketapp/Myticket/vehientai.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';

class MyticketInfor extends StatelessWidget {
  MyTicket myticket;
  int sst;

  MyticketInfor({required this.sst, required this.myticket});

  ChairController controllerMtI = Get.put(ChairController());
MyTicketController myTicketController=Get.put(MyTicketController());
  String time(String s){
    String s1=s.substring(11,16);
    return "$s1 Giờ, Ngày ${Swap(s)}";
  }
  String Swap(String s) {
    String yyyy = s.substring(0, 4);
    String mm = s.substring(5, 7);
    String dd = s.substring(8, 10);
    return (dd +"/"+ mm +"/"+ yyyy);
  }
  @override
  Widget build(BuildContext context) {
    return sst==0?Scaffold(
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
                        Text(controllerMtI.accountObj.tenNd,
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
                        Text("(VN)+84: ${controllerMtI.accountObj.sdt}",
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
                        Container(child:Text(myticket.tenTuyenXe, style: AppThemes.Text18) ,width: 250,)

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
                        Text("Thời gian: ${time(myticket.ngayXuatBen)}", style: AppThemes.Text18),
                        // Text(giodi, style: AppThemes.Text18Medium,),
                        //Text(, style: AppThemes.Text18Medium,),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.airline_seat_recline_normal_sharp,
                          color: AppColors.background,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Chỗ: ${myticket.maChoNgoi} ", style: AppThemes.Text18,),
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
                        Text("${NumberFormat.simpleCurrency(locale: "vi").format(myticket.donGia)}", style: AppThemes.Text18Medium),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30)
            ],
          ),
        ),
      ),
    ):Scaffold(
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
          height: 650,
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
          child: ListView(
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
                        Text(controllerMtI.accountObj.tenNd,
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
                        Text("(VN)+84: ${controllerMtI.accountObj.sdt}",
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
                        Container(child: Text(myticket.tenTuyenXe, style: AppThemes.Text18),width: 200,)
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
                        Text("Thời gian: ${time(myticket.ngayXuatBen)}", style: AppThemes.Text18),
                        // Text(giodi, style: AppThemes.Text18Medium,),
                        //Text(, style: AppThemes.Text18Medium,),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.airline_seat_recline_normal_sharp,
                          color: AppColors.background,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Chỗ: ${myticket.maChoNgoi} ", style: AppThemes.Text18,),
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
                        Text("${NumberFormat.simpleCurrency(locale: "vi").format(myticket.donGia)}", style: AppThemes.Text18Medium),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Text("Bạn đã thanh toán trước 50% giá vé",
                    style: AppThemes.Text18),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30,bottom: 50),
                child: Row(
                  children: [
                    Text("* Thanh toán trước:  ",
                        style: TextStyle(color: Colors.red, fontSize: 18)),
                    Container(
                      height: 30,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.zero, right: Radius.zero)),
                      child: Center(
                        child: Text(
                            "${NumberFormat.simpleCurrency(locale: "vi").format(myticket.donGia*0.5)}"),
                      ),
                    )
                  ],
                ),
              ),
              Center(child:InkWell(child:  Container(
                height: 70,
                width: 200,
                decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 2), borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(child: Text("Hủy vé xe", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 25)),),) ,onTap: (){
                showDialog(context: context, builder: (_)=>  AlertDialog(
                  title: Text("Thông báo",style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 25),),
                  content:  Text("Bạn có muốn hủy vé?",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                  actions: <Widget>[
                    FlatButton(
                        child: Text("Xác nhận",style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),),
                        onPressed: (){
                          myTicketController.apiDelete(myticket);
                          Get.back();
                          Get.back();
                        }),
                    FlatButton(
                        child: Text("Hủy",style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold, fontSize: 20),),
                        onPressed: () {
                          Get.back();
                        })
                  ],
                ));

              },),),



              SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}
