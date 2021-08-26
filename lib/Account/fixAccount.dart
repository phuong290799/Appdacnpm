import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Controller/Chair_controller.dart';
import 'package:ticketapp/Controller/Home_controller.dart';
import 'package:ticketapp/Controller/acount_controller.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';

class FixAccount extends StatefulWidget {
  @override
  _FixAccountState createState() => _FixAccountState();
}

class _FixAccountState extends State<FixAccount> {
  AcountController controller = Get.put(AcountController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print("0");

    return Scaffold(
        //resizeToAvoidBottomInset: false,
        body: Obx(() => controller.loadStatus == true
            ? Column(
                children: <Widget>[buildAppBar(), buildInfo()],
              )
            : Center(
                child: CircularProgressIndicator(),
              )));
  }

  Container buildAppBar() {
    return Container(
      color: AppColors.background,
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                child: Icon(
                  Icons.arrow_back_sharp,
                  size: 20,
                  color: Colors.white,
                ),
                onTap: () {
                  Get.back();
                },
              ),
              Text(
                "Cập nhập Thông Tin",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
              InkWell(
                child: Text("Lưu",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 20)),
                onTap: () {
                  controller.apiUpdateInfo();
                },
              ),
            ],
          ),
          SizedBox(height: 40),
          InkWell(
              child: controller.files.value.path == ""
                  ? CircleAvatar(
                      maxRadius: 70,
                      backgroundImage:
                          NetworkImage("${controller.imageUrl.text}"),
                    )
                  : CircleAvatar(
                maxRadius: 70,
                backgroundImage: FileImage(controller.files.value),
                    ),
              onTap: () {
                controller.selectFile();
              })
        ],
      ),
    );
  }

  Expanded buildInfo() {
    return Expanded(
        child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Center(
          child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowGlow();
          return true;
        },
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                buildItemInfo("Tên", controller.ten),
                SizedBox(height: 35),
                buildItemInfo("SDT", controller.sdt),
                SizedBox(height: 35),
                buildItemInfo("CMND", controller.cmnd),
                SizedBox(height: 35),
                buildItemInfo("Địa Chỉ", controller.diaChi),
                SizedBox(height: 35),
                buildItemInfo("Ngày Sinh", controller.ngaySinh),
                SizedBox(height: 35)
              ],
            ),
          ),
        ),
      )),
    ));
  }

  Container buildItemInfo(String name, TextEditingController controller) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          TextField(
            keyboardType: name == "SDT" || name == "CMND"
                ? TextInputType.number
                : (name == "Ngày Sinh"
                    ? TextInputType.datetime
                    : TextInputType.text),
            textCapitalization: TextCapitalization.words,
            controller: controller,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
            decoration: InputDecoration(border: InputBorder.none),
          ),
          Container(
            height: 2,
            color: Colors.black12,
          )
        ],
      ),
    );
  }
}
