import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Home/detailSearch.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';

class SelectChair extends StatelessWidget {
  late String nhaxe,noidi,noiden,giodi,gioden,day;
  late int giatien;
  late String tang="2";
  late String hang="b";
  late String cho="5";
  SelectChair({required this.noidi,required this.noiden,required this.nhaxe,required this.giodi,
    required this.gioden,required this.giatien,required this.day});
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
            Text("Chọn chỗ", style: AppThemes.Text20Medium),
            SizedBox(
              width: 50,
            ),
          ],
        ),
        backgroundColor: AppColors.scaffold,
      ),
      body: Padding(
          padding: EdgeInsets.all(15),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.colors_icons,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 20,
                    offset: Offset(4, 10),
                  )
                ]),
            child: Column(
              children: [
                SizedBox(height: 100,),
                RaisedButton(
                  onPressed: (){
                    Get.to(()=>DetailSearch(noidi:noidi,
                      noiden:noiden,
                      nhaxe:nhaxe,
                      giodi:giodi,
                      gioden:gioden,
                      giatien:giatien,
                      day: day,
                      tang:tang,
                      hang: hang,
                      cho: cho,

                    ));

                  },
                  color: AppColors.background,
                  child: Container(
                    width: 250,
                    height: 40,
                    child: Center(
                      child: Text(
                        "Chọn chỗ",
                        style: AppThemes.text18container,
                      ),
                    ),
                  ),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide:
                      BorderSide(color: AppColors.background, width: 1)),
                ),
              ],
            ),
          )),
    );
  }
}
