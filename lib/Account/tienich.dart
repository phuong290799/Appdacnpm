import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';

class Tienich extends StatelessWidget {
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
            Text("Tiện ích", style: AppThemes.Text18Medium),
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
                      child: Text("Tiện ích của nhà xe",style: AppThemes.Text16Medium,),
                    ),
                    Divider(
                      height: 20,
                      color: AppColors.shadow.withOpacity(0.2),
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Text("Dép",style: AppThemes.Text18Medium),
                        Text("Khi dừng ở các trạm sẽ có dép xuống xe",style: TextStyle(
                          fontSize: 16,color: AppColors.shadow.withOpacity(0.5),))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Text("Gửi kèm xe máy",style: AppThemes.Text18Medium),
                        Text("Nhà xe cho khách gửi kèm xe máy ( +50% giá vé)",
                            textAlign: TextAlign.center,style: TextStyle(
                          fontSize: 16,color: AppColors.shadow.withOpacity(0.5),))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Text("Khẩu trang",style: AppThemes.Text18Medium),
                        Text("Có khẩu trang hỗ trợ hàh khách",
                            textAlign: TextAlign.center,style: TextStyle(
                          fontSize: 16,color: AppColors.shadow.withOpacity(0.5),))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Text("Nước uống",style: AppThemes.Text18Medium),
                        Text("Hỗ trợ nước suối",style: TextStyle(
                          fontSize: 16,color: AppColors.shadow.withOpacity(0.5),))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Text("Gối, chăn",style: AppThemes.Text18Medium),
                        Text("Có sẵn trên chỗ ngồi của hành khách",
                            textAlign: TextAlign.center,style: TextStyle(
                          fontSize: 16,color: AppColors.shadow.withOpacity(0.5),))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Text("Búa phá kính",style: AppThemes.Text18Medium),
                        Text("Dùng trong trường hợp khẩn cấp, được trang bị gốc phải cửa sổ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                          fontSize: 16,color: AppColors.shadow.withOpacity(0.5),))
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
