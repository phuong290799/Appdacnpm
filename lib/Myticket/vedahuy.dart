
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
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),

      child: Container(
          height: MediaQuery.of(context).size.height,
          child: Obx(()=>myTicketController.ListTicketDelete.value.length==0?Center(child: Text("Không có vé")):ListView.builder(
            itemCount: myTicketController.ListTicketDelete.length,
            itemBuilder: (context, index) {
              MyTicket myTicket=myTicketController.ListTicketDelete[index];
              return InkWell(
                onTap: (){
                  Get.to(()=>MyticketInfor(myTicket,3));
                  // print(controllervht.listTicketed[index].listcho);
                },
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    decoration: BoxDecoration(border: Border.all(color: Colors.black12,width: 1),borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      children: [
                        Icon(Icons.delete),
                        SizedBox(width: 10,),
                        Flexible(
                          child: Text(
                              "${myTicket.tenTuyenXe}",style: AppThemes.Text18
                          ),
                        ),
                      ],
                    )),
              );
            },
          ))
      ),
    );
  }
}
