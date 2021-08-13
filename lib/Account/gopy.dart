import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';
class Gopy extends StatelessWidget {
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
            Text("Góp ý", style: AppThemes.Text18Medium),
            SizedBox(
              width: 50,
            ),
          ],
        ),
        backgroundColor: AppColors.scaffold,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Container(

          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.colors_icons,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadow.withOpacity(0.2),
                        blurRadius: 100,
                        offset: Offset(1, 1),
                      )
                    ]),

                height: 200,
                child: TextField(
                  maxLength: 300,
                  maxLines: null,
                  style: AppThemes.Text18,
                  decoration: InputDecoration.collapsed(
                    hintText: "Nhập nội dung...",
                    hintStyle: AppThemes.Text16,
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(15)),
                    // )

                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.colors_icons,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadow.withOpacity(0.2),
                        blurRadius: 100,
                        offset: Offset(1, 1),
                      )
                    ]),
                child: Center(child: Text("Gửi đến: adminticketapp@gmail.com",style: AppThemes.Text18Medium,))
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
                child: RaisedButton(
                  onPressed: sendgopy,
                  color: AppColors.background,
                  child: Container(
                    width: 250,
                    height: 40,
                    child: Center(
                      child: Text(
                        "Gửi",
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
  void sendgopy(){

  }
}
