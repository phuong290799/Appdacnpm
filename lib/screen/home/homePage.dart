import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ticketapp/Controller/controller.dart';
import 'package:ticketapp/Controller/controller_database.dart';
import 'package:ticketapp/Models/searchObj.dart';
import 'package:ticketapp/constant/colors.dart';
import 'package:ticketapp/constant/styles.dart';

import 'export_home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _noidi = TextEditingController();
  final TextEditingController _noiden = TextEditingController();
  DateTime date = DateTime.now();
  String pickday = DateFormat('dd-MM-yyyy').format(DateTime.now());

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2020),
      lastDate: new DateTime(2022),
    );
    pickday = DateFormat('dd-MM-yyyy').format(picked!);
    if (picked != null)  pickday =  pickday.toString();
    controllerHome.day.value = pickday;
  }
  Controller controllerHome = Get.put(Controller());
  ControllerDatabase homePageController = ControllerDatabase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                              color: AppColors.background,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.background.withOpacity(0.3),
                                  blurRadius: 10,
                                  offset: Offset(4, 8),
                                )
                              ]),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Chào bạn!",
                                    style: AppThemes.text30container,
                                  ),
                                  Text(
                                    "Bạn muốn đi đâu ?",
                                    style: AppThemes.text18container,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 70,
                              ),
                              Icon(
                                Icons.directions_bus_rounded,
                                size: 100,
                                color: Colors.black,
                              ),
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 145, 20, 20),
                      child: Container(
                        padding: EdgeInsets.only(top: 30, bottom: 30),
                        height: 370,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.primary,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.shadow.withOpacity(0.2),
                                blurRadius: 20,
                                offset: Offset(4, 10),
                              )
                            ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.my_location,
                                  size: 40,
                                  color: AppColors.background,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  height: 50,
                                  width: 250,
                                  child: TextField(
                                    controller: _noidi,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                    decoration: InputDecoration(
                                        labelText: "Nơi xuất phát",
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 2),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)))),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.my_location,
                                  size: 40,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  width: 250,
                                  height: 50,
                                  child: TextField(
                                    controller: _noiden,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                    decoration: InputDecoration(
                                        labelText: "Nơi đến",
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 2),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)))),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.calendar_today_rounded,
                                  size: 40,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      _selectDate();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            width: 1, color: Colors.black26),
                                      ),
                                      height: 50,
                                      width: 250,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 15,left: 10),
                                        child: Obx(()=>
                                          Text(
                                            "Ngày: ${controllerHome.day.value!=""?controllerHome.day.value:pickday}"
                                           ,
                                              style: AppThemes.Text18),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                              child: SizedBox(
                                width: 150,
                                height: 52,
                                child: RaisedButton(
                                  highlightColor: Colors.pinkAccent,
                                  onPressed: (){
                                   // homePageController.apiGetAllBusStation();
                                    onsearch();
                                  },
                                  child: Text(
                                    "Tìm vé xe",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  color: AppColors.background,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Lịch sử tìm kiếm ", style: AppThemes.Text18,),
                      ),
                      InkWell(
                        onTap: (){
                          controllerHome.listHistory.clear();
                        },
                        child: Text(
                          "Xoá tất cả ", style: TextStyle(
                          fontSize: 18,color: Colors.blue
                        )),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 190,
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      // borderRadius: BorderRadius.circular(0),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.shadow.withOpacity(0.2),
                            blurRadius: 10,
                            offset: Offset(2, 10)
                        )
                      ]
                  ),
                  child: Obx(()=>
                     ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controllerHome.listHistory.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 0),
                              child: HistorySearch(
                                noidi:controllerHome.listHistory[index].noidi,
                                  noiden: controllerHome.listHistory[index].noiden,
                                  day: controllerHome.listHistory[index].day,

                              )),
                        );
                      },),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onsearch() {
    if (_noidi.text.isEmpty || _noiden.text.isEmpty) {
      Get.snackbar(
        'Lỗi tìm kiếm',
        'Nhập nơi đến và nơi đi',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.color_snackbar,

      );
    } else {
      controllerHome.day.value = pickday;
      controllerHome.noidi.value=_noidi.text;
      controllerHome.noiden.value =_noiden.text ;
      controllerHome.listHistory.add(SearchObj(_noidi.text, _noiden.text, pickday));
      Get.to(() => KetquaSearch(
        noidi:controllerHome.noidi.value,
        noiden: controllerHome.noiden.value,
        day: controllerHome.day.value,
      ));

    }
  }
}