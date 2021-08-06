
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Controller/controller.dart';
import 'file:///E:/flutter2/ticketapp/lib/screen/Myticket/myticketInfor.dart';
import 'package:ticketapp/constant/colors.dart';
import 'package:ticketapp/constant/styles.dart';
class vehientai extends StatelessWidget {
  Controller controllervht = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          padding: const EdgeInsets.all(5),
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

          child: Container(
            height: MediaQuery.of(context).size.height-240,
            child: ListView.builder(
              itemCount: controllervht.listTicketed.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Get.to(()=>MyticketInfor(
                      noidi: controllervht.listTicketed[index].nhaxe,
                      noiden: controllervht.listTicketed[index].noidi,
                      nhaxe: controllervht.listTicketed[index].noiden,
                      giodi: controllervht.listTicketed[index].giodi,
                      gioden: controllervht.listTicketed[index].gioden,
                      giatien: controllervht.listTicketed[index].giatien,
                      day: controllervht.listTicketed[index].day,
                      listcho: controllervht.listTicketed[index].listcho,
                    ));
                    print(controllervht.listTicketed[index].listcho);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.all(20),
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
                    child: Row(
                      children: [
                        Icon(Icons.check_circle_outline),
                        SizedBox(width: 10,),
                        Flexible(
                          child: Text(
                              "${controllervht.listTicketed[index].noidi} --> ${controllervht.listTicketed[index].noiden}",style: AppThemes.Text18
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },

            ),
          ),
        ),
      ),
    );
  }
}
