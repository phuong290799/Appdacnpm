import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ticketapp/Controller/Chair_controller.dart';
import 'package:ticketapp/Home/detailSearch.dart';
import 'package:ticketapp/Models/SeatInfor.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';

class SelectChair extends StatefulWidget {

  late String nhaxe, noidi, noiden, giodi, gioden, day;
  late double giatien;
  late int maChuyenXe;

  SelectChair(
      {required this.nhaxe,
      required this.noidi,
      required this.noiden,
      required this.giodi,
      required this.gioden,
      required this.giatien,
      required this.day,
      required this.maChuyenXe});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SelectChairState();
  }
}

class _SelectChairState extends State<SelectChair> {
  ChairController controllerChair = Get.put(ChairController());
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      controllerChair.apiGetChair(widget.maChuyenXe);
    });
  }
  String getNameOfListCho(List<SeatInfor> list){
    String s="";
      for(int i=0; i<list.length; i++){
        if(i==0){
          s=s+list[i].name;
        }
        else{
          s=s+", "+list[i].name;
        }
      }
    return s;
  }
  @override
  Widget build(BuildContext context) {

    //controllerChair.apiGetChair();
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
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 30),
        child: Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              width: MediaQuery.of(context).size.width,
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
                  Container(
                    height: 100,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: AppColors.scaffold,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppColors.background),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4, right: 15),
                          child: Text("Còn trống"),
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppColors.background),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4, right: 15),
                          child: Text("Đã đặt"),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppColors.background),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Text("Đang đặt"),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                    color: AppColors.shadow.withOpacity(0.2),
                    indent: 0,
                    endIndent: 0,
                    thickness: 4,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 100,
                        ),
                        Expanded(
                            child: Text(
                          "Tầng 1",
                          style: AppThemes.Text18Medium,
                        )),
                        Text(
                          "Tầng 2",
                          style: AppThemes.Text18Medium,
                        ),
                        SizedBox(
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                    child: Container(
                        padding: EdgeInsets.all(10),
                        height: 430,
                        decoration: BoxDecoration(
                            color: AppColors.scaffold,
                            borderRadius: BorderRadius.circular(15),
                            border:
                                Border.all(width: 1, color: AppColors.scaffold),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.shadow.withOpacity(0.2),
                                blurRadius: 20,
                                offset: Offset(4, 10),
                              )
                            ]),
                        child: Obx(() => GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controllerChair.listSeat.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 6,
                                    crossAxisSpacing: 0,
                                    mainAxisSpacing: 20),
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        Border.all(color: AppColors.background),
                                    color: controllerChair
                                            .listChair[index].tinhtrang
                                        ? Colors.blue
                                        : controllerChair
                                            .listChair[index].colorChair,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (controllerChair.listChair[index].tinhtrang) {
                                        } else {
                                          if (controllerChair.listChair[index].colorChair == AppColors.background) {
                                            controllerChair.listChair[index].colorChair = Colors.white;
                                            controllerChair.listSelected.removeWhere((element) => element.MaGhe==controllerChair.listChair[index].id);
                                          } else {
                                            controllerChair.listChair[index]
                                                    .colorChair =
                                                AppColors.background;
                                            controllerChair.listSelected.add(
                                                SeatInfor(
                                                    name: controllerChair
                                                        .listChair[index].name,
                                                    MaGhe: controllerChair
                                                        .listChair[index].id));
                                          }

                                        }
                                        print(controllerChair.listSelected.length);
                                      });
                                      //  print(controllerChair.listSelected);
                                    },
                                    child: Center(
                                        child: Text(controllerChair
                                            .listChair[index].name)),
                                  ),
                                ),
                              );
                            }))),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Đang đặt: ${controllerChair.listSelected.length == 0 ? "":getNameOfListCho(controllerChair.listSelected)} ",
                          style: AppThemes.Text18Medium,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Tổng tiền: ${NumberFormat.simpleCurrency(locale: "vi").format(controllerChair.listSelected.length * widget.giatien)}",
                          style: AppThemes.Text18Medium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 50),
                    child: RaisedButton(
                      onPressed: () {
                        if (controllerChair.listSelected.length == 0) {
                          Get.snackbar(
                            'Lỗi chọn ghế',
                            'Vui lòng chọn ghế ngồi',
                            snackPosition: SnackPosition.BOTTOM,
                            maxWidth: 350,
                            backgroundColor: AppColors.color_snackbar,
                          );
                        } else {

                          Get.to(() => DetailSearch(
                                noidi: widget.noidi,
                                noiden: widget.noiden,
                                nhaxe: widget.nhaxe,
                                giodi: widget.giodi,
                                gioden: widget.gioden,
                                giatien: widget.giatien,
                                day: widget.day,
                                listcho: controllerChair.listSelected,
                              ));
                        }
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
                          borderSide: BorderSide(
                              color: AppColors.background, width: 1)),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
