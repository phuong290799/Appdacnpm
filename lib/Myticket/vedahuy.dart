
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Controller/Myticket_controller.dart';
import 'package:ticketapp/Models/myticket.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';

import 'myticketInfor.dart';
class vedahuy extends StatelessWidget {
  MyTicketController myTicketController=Get.put(MyTicketController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),

        child: Container(
            height: MediaQuery.of(context).size.height,
            child: Obx(()=>myTicketController.ListTicketDelete.value.length==0?Center(child: Text("Không có vé")):ListView.builder(
              itemCount: myTicketController.ListTicketDelete.length,
              itemBuilder: (context, index) {
                MyTicket myTicket=myTicketController.ListTicketDelete[index];
                return InkWell(
                  onTap: (){
                    Get.to(()=>MyticketInfor(myticket: myTicket,sst: 0,));
                    // print(controllervht.listTicketed[index].listcho);
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
                              "${myTicketController.ListTicketDelete[index].tenTuyenXe}",style: AppThemes.Text18
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ))
        ),
      ),
    );
  }
}
