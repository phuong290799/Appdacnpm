import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';

class Chinhsach extends StatelessWidget {
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
            Text("Chính sách huỷ vé", style: AppThemes.Text18Medium),
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
                padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                child: Column(
                  children: [
                   Container(
                     child: Text("Chính sách huỷ vé & hoàn tiền",style: AppThemes.Text16Medium,),
                   ),
                    Divider(
                      height: 20,
                      color: AppColors.shadow.withOpacity(0.2),
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                       Expanded(child: Text("Thời gian huỷ",style: TextStyle(
                         fontSize: 18,color: AppColors.shadow.withOpacity(0.5),
                       ))),
                        Text("Phí huỷ",style: TextStyle(
                          fontSize: 18,color: AppColors.shadow.withOpacity(0.5),))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(child: Text("Trước 2 giờ",style: TextStyle(
                          fontSize: 18,color: AppColors.shadow.withOpacity(0.5),
                        ))),
                        Text("50%",style: TextStyle(
                          fontSize: 18,color: AppColors.shadow.withOpacity(0.5),))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(child: Text("Trước 12 giờ",style: TextStyle(
                          fontSize: 18,color: AppColors.shadow.withOpacity(0.5),
                        ))),
                        Text("30%",style: TextStyle(
                          fontSize: 18,color: AppColors.shadow.withOpacity(0.5),))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(child: Text("Trước 48 giờ",style: TextStyle(
                          fontSize: 18,color: AppColors.shadow.withOpacity(0.5),
                        ))),
                        Text("15%",style: TextStyle(
                          fontSize: 18,color: AppColors.shadow.withOpacity(0.5),))
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
                      child: RaisedButton(
                        onPressed:(){
                          Get.back();
                        },
                        color: AppColors.background,
                        child: Container(
                          width: 250,
                          height: 40,
                          child: Center(
                            child: Text(
                              "Đã rõ",
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
            ],
          ),
        ),
      ),
    );
  }
}
