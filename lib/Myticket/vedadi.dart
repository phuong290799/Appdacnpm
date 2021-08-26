
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Controller/Myticket_controller.dart';
import 'package:ticketapp/Models/myticket.dart';
import 'package:ticketapp/Myticket/myticketInfor.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';
class vedadi extends StatelessWidget {
  MyTicketController myTicketController=Get.put(MyTicketController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Container(
              height: MediaQuery.of(context).size.height-240,
              child: Obx(()=>myTicketController.stt==0?Center(child: CircularProgressIndicator()):Container(child: myTicketController.list(0).length==0?Center(child: Text("Không có vé")):ListView.builder(
                itemCount: myTicketController.list(0).length,
                itemBuilder: (context, index) {
                  MyTicket myTicket=myTicketController.list(0)[index];
                  return InkWell(
                    onTap: (){
                      Get.to(()=>MyticketInfor(myTicket,2));
                      // print(controllervht.listTicketed[index].listcho);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                        decoration: BoxDecoration(border: Border.all(color: Colors.black12,width: 1),borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Row(
                      children: [
                        Icon(Icons.done),
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
              )))
          ),
        ),
      ),
    );
  }
}
