import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Controller/Home_controller.dart';
import 'package:ticketapp/Home/ketquaSearch.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';
class HistorySearch extends StatelessWidget {
  String noidi,noiden,day;
  HistorySearch({required this.noidi,required this.noiden,required this.day});
  HomeController controllerHistory =Get.find();
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        Get.to(() => KetquaSearch(
          noidi:noidi,
          noiden:noiden,
          day:day,
        ));
      },
      child: Container(
        width: 200,
        decoration: BoxDecoration(
            color: AppColors.scaffold,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: AppColors.shadow.withOpacity(0.2),
                  blurRadius: 40,
                  offset: Offset(2,10)
              )
            ]
        ),
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          Text("Ngày: $day",style: AppThemes.Text16Medium),
          Divider(
            color: AppColors.shadow.withOpacity(0.04),
            thickness: 2,
            height: 20,
          ),

          Text(noidi,style: TextStyle(fontSize: 16,color: Colors.blue),),
          Icon(Icons.arrow_right_alt_sharp),
          Text(noiden,style: TextStyle(fontSize: 16,color: Colors.red),),

          SizedBox(
            height: 15,
          ),
          Expanded(
            child: SizedBox(
              height: 15,
            ),
          ),
          Container(
            height: 20,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)
              ),
              color: AppColors.background,
            ),
          )
        ],
      ),

      ),
    );
  }
}
