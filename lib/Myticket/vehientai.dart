import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Controller/Chair_controller.dart';
import 'package:ticketapp/Controller/Home_controller.dart';
import 'package:ticketapp/Controller/Myticket_controller.dart';
import 'package:ticketapp/Models/myticket.dart';
import 'package:ticketapp/Myticket/myticketInfor.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';

class vehientai extends StatelessWidget {
  MyTicketController myTicketController = Get.put(MyTicketController());
  @override
  Widget build(BuildContext context) {
    myTicketController.apiGetMyTicket();
    // myTicketControlle\r.list(myTicketController.ListTicket[0]);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Container(
              height: MediaQuery.of(context).size.height - 240,
              child: Obx(() => myTicketController.stt == 0
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                      child: myTicketController.list(1).length == 0
                          ? Center(child: Text("Không có vé"))
                          : ListView.builder(
                              itemCount: myTicketController.list(1).length,
                              itemBuilder: (context, index) {
                                MyTicket myTicket =
                                    myTicketController.list(1)[index];
                                return InkWell(
                                  onTap: () {
                                    Get.to(() => MyticketInfor(myTicket, 1));
                                    // print(controllervht.listTicketed[index].listcho);
                                  },
                                  child: Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black12, width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Row(
                                        children: [
                                          Icon(Icons.directions_bus_outlined),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Flexible(
                                            child: Text(
                                                "${myTicket.tenTuyenXe}",
                                                style: AppThemes.Text18),
                                          ),
                                        ],
                                      )),
                                );
                              },
                            )))),
        ),
      ),
    );
  }
}
