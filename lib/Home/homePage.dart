import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ticketapp/Home/historySearch.dart';
import 'package:ticketapp/Home/ketquaSearch.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _noidi = TextEditingController();
  final TextEditingController _noiden = TextEditingController();
  DateTime date = DateTime.now();
  String pickday = DateFormat('EEEE, dd-MM-yyyy').format(DateTime.now());

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2020),
      lastDate: new DateTime(2022),
    );
    pickday = DateFormat('EEEE, dd-MM-yyyy').format(picked!);
    if (picked != null) setState(() =>  pickday =  pickday.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          constraints: BoxConstraints.expand(),
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
                                color: AppColors.shadow,
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
                                Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      _selectDate();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            width: 1, color: Colors.black45),
                                      ),
                                      height: 50,
                                      width: 250,
                                      child: Center(
                                        child: Text(
                                          pickday,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black)),
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
                                    //onsearch,
                                    Get.to(() => KetquaSearch(day:pickday));
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
                  child: Text(
                    "Lịch sử tìm kiếm ", style: AppThemes.Text18Medium,),
                ),
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      // borderRadius: BorderRadius.circular(0),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.shadow,
                            blurRadius: 10,
                            offset: Offset(2, 10)
                        )
                      ]
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 0),
                            child: HistorySearch()),
                      );
                    },),
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
      Get.to(() => KetquaSearch(day:pickday));
    }
  }
}