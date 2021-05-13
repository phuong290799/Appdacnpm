import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Controller/controller.dart';
import 'package:ticketapp/Home/selectChair.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';

class KetquaSearch extends StatelessWidget {
  String noidi, noiden, day;
  KetquaSearch({required this.noidi, required this.noiden, required this.day});
  Controller controllersearch = Get.find();
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
            Text("Kết quả tìm kiếm", style: AppThemes.Text20Medium),
            SizedBox(
              width: 50,
            ),
          ],
        ),
        backgroundColor: AppColors.scaffold,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
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
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Center(
                            child: Text(
                          "Ngày đi: ${controllersearch.day.value}",
                          style: AppThemes.Text18Medium,
                        )),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.my_location,
                              size: 30,
                              color: AppColors.background,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                                child: Text(
                              controllersearch.noidi.value,
                              style: AppThemes.Text18Medium,
                            )),
                            Center(
                              child: Icon(
                                Icons.arrow_right_alt_outlined,
                                size: 40,
                                color: AppColors.background,
                              ),
                            ),
                            Icon(
                              Icons.my_location,
                              size: 30,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              controllersearch.noiden.value,
                              style: AppThemes.Text18Medium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 3,
                    height: 40,
                    color: AppColors.shadow.withOpacity(0.1),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 250,
                    child: controllersearch.listsearch.length != 0
                        ? ListView.builder(
                            itemCount: controllersearch.listsearch.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: AppColors.scaffold,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.shadow.withOpacity(0.2),
                                          blurRadius: 20,
                                          offset: Offset(4, 10),
                                        )
                                      ]),
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(() => SelectChair(
                                            nhaxe: controllersearch
                                                .listsearch[index].nhaxe,
                                            noidi: controllersearch
                                                .listsearch[index].bendi,
                                            noiden: controllersearch
                                                .listsearch[index].benden,
                                            giodi: controllersearch
                                                .listsearch[index].giodi,
                                            gioden: controllersearch
                                                .listsearch[index].gioden,
                                            giatien: controllersearch
                                                .listsearch[index].giatien,
                                            day: controllersearch.day.value,
                                          ));
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                controllersearch
                                                    .listsearch[index].giodi,
                                                style: AppThemes.Text20Bold,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                height: 3,
                                                width: 50,
                                                color: AppColors.background,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                controllersearch
                                                    .listsearch[index].gioden,
                                                style: AppThemes.Text20Bold,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                controllersearch
                                                    .listsearch[index].bendi,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.blue),
                                              ),
                                              Icon(Icons.arrow_right_alt_sharp),
                                              Text(
                                                controllersearch
                                                    .listsearch[index].benden,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.red),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1,
                                          height: 0,
                                          color: AppColors.shadow
                                              .withOpacity(0.001),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: AppColors.shadow
                                                            .withOpacity(0.02),
                                                        blurRadius: 10,
                                                        offset: Offset(0, 1),
                                                      )
                                                    ]),
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    child: Container(
                                                        height: 100,
                                                        width: 100,
                                                        child: Image.asset(
                                                          "assets/images/khach2.png",
                                                          fit: BoxFit.cover,
                                                        ))),
                                              ),
                                              Text(
                                                " ${controllersearch.listsearch[index].nhaxe}   ",
                                                style: AppThemes.Text16,
                                              ),
                                              Image.asset(
                                                "assets/images/ic_crown.png",
                                                fit: BoxFit.cover,
                                              ),
                                              Text(
                                                "  Top",
                                                style: AppThemes.Text14,
                                              ),
                                              Expanded(child: SizedBox()),
                                              Image.asset(
                                                "assets/images/ic_star.png",
                                                fit: BoxFit.cover,
                                              ),
                                              Text(
                                                " 5.0",
                                                style: AppThemes.Text14Medium,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Text(
                                            "Giá tiền: ${controllersearch.listsearch[index].giatien}đ",
                                            style: AppThemes.Text16,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Text(
                                            "Còn: ${controllersearch.listsearch[index].ghetrong} ghế trống",
                                            style: AppThemes.Text16,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          height: 20,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(15),
                                                bottomRight:
                                                    Radius.circular(15)),
                                            color: AppColors.background,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : Container(
                            child: Center(
                                child: Text("Vui lòng đợi hoặc thử lại!")),
                          ),
                  ),
                  Container(
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      color: AppColors.scaffold,
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
