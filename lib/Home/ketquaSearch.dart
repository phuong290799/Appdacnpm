import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ticketapp/Controller/Home_controller.dart';
import 'package:ticketapp/Home/selectChair.dart';
import 'package:ticketapp/Models/ticketObj.dart';


class KetquaSearch extends StatelessWidget {
  String noidi, noiden, day;
  KetquaSearch({required this.noidi, required this.noiden, required this.day});
  HomeController controllersearch = Get.put(HomeController());
  @override
  Widget itemTiker(TicketObj obj) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          color: Colors.white,
          elevation: 5,
          child: Container(
            height: 250,
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    color: Color(0xffe0eefc),
                  ),
                  height: 35,
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: 55,
                          child: Icon(
                            Icons.confirmation_number_outlined,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                              color: Colors.indigoAccent),
                          padding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10)),
                      SizedBox(width: 10),
                      Expanded(
                          child: Container(
                        child: Text("Yêu cầu thanh toán trước",
                            style: TextStyle(fontSize: 18, color: Colors.blue)),
                      ))
                      // Expanded(child: child)
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  decoration: BoxDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(time(obj.ngayXuatBen),
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          SizedBox(width: 5),
                          Icon(Icons.album, color: Colors.blue, size: 15),
                          Text("---------",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black12)),
                          Text(times(obj.ngayXuatBen, obj.ngayDen),
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey)),
                          Text("---------",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black12)),
                          Icon(Icons.album, color: Colors.red, size: 15),
                          SizedBox(width: 5),
                          Text(time(obj.ngayDen),
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(width: 17),
                          Container(
                            width: 140,
                            // decoration: BoxDecoration(color: Colors.blue),
                            child: Text(obj.tenBxDi,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),
                          Expanded(child: Container()),
                          Container(
                              width: 140,
                              //decoration: BoxDecoration(color: Colors.blue),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    width: 120,
                                    child: Text(obj.tenBxDen,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                  )
                                ],
                              )),
                          SizedBox(width: 17),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  decoration: BoxDecoration(color: Colors.black12),
                ),
                Container(
                    height: 73,
                    decoration: BoxDecoration(),
                    child: Column(
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(width: 15),
                              Container(
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/images/khach2.png"),
                                  radius: 100.0,
                                ),
                                height: 50,
                                width: 50,
                              ),
                              SizedBox(width: 10),
                              Column(
                                children: <Widget>[
                                  Text(obj.nhaXe,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  Text("Giường nằm 36 chỗ",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.blue))
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                              Expanded(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Row(children: <Widget>[
                                        Text("4.0",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.black)),
                                        Icon(Icons.star,
                                            size: 20, color: Colors.amber)
                                      ]),
                                      Text("150 đánh giá",
                                          style: TextStyle(
                                              fontSize: 10, color: Colors.grey))
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                ],
                              ))
                            ]),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )),
                Container(
                  height: 1,
                  decoration: BoxDecoration(color: Colors.black12),
                ),
                Container(
                    height: 40,
                    child: Column(
                      children: [
                        Row(children: <Widget>[
                          SizedBox(width: 15),
                          Text("Còn ${obj.soChoTrong} chỗ trống",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue)),
                          Expanded(
                              child: Row(
                            children: <Widget>[
                              Text(
                                  NumberFormat.simpleCurrency(locale: 'vi')
                                      .format(obj.donGia),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ],
                            mainAxisAlignment: MainAxisAlignment.end,
                          )),
                          SizedBox(width: 15),
                        ]),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }

  String time(String time) {
    return time.substring(11, 16);
  }

  String times(String time1, String time2) {
    DateTime s1 = DateTime.parse(time1);
    DateTime s2 = DateTime.parse(time2);
    var t = s2.difference(s1);
    time1 = t.toString().substring(0, 5);
    return time1.substring(0, 2) + " Giờ " + time1.substring(3, 4) + " Phút";
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        elevation: 1,
        title: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("$noidi",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                SizedBox(width: 10),
                Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white,
                  size: 25,
                ),
                SizedBox(width: 10),
                Text("$noiden",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 5),
            Text("$day", style: TextStyle(fontSize: 18))
          ],
        )),
        backgroundColor: Color(0xff4949ff),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: MediaQuery.of(context).size.height,
        color: Color(0xffedeaea),
        child: controllersearch.listsearch.length == 0
            ? Container(
                child: Center(
                    child: Text("Không tìm thấy chuyến xe phù hợp với bạn!",
                        style: TextStyle(fontSize: 20))))
            : ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: controllersearch.listsearch.length,
                itemBuilder: (context, index) {
                  TicketObj obj = controllersearch.listsearch[index];
                  return index == 0
                      ? Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 20),
                          Text("Đặt chuyến xe trực tuyến",
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          //itemTiker(),
                          InkWell(child: itemTiker(obj),
                          onTap: (){
                           // controllersearch.update();
                            controllersearch.maCx=obj.maChuyenXe;
                            print("MCX:${obj.maChuyenXe}");
                            Get.to(() => SelectChair(
                              maChuyenXe: obj.maChuyenXe,
                              nhaxe: obj.nhaXe,
                              noidi: obj.tenBxDi,
                              noiden: obj.tenBxDen,
                              giodi: obj.ngayXuatBen,
                              gioden: obj.ngayDen,
                              giatien: obj.donGia,
                              day: controllersearch.day.value,
                            ));
                          })
                        ],
                      ))
                      : InkWell(child: itemTiker(obj), onTap: () {
                    print("MCX:${obj.maChuyenXe}");

                        controllersearch.maCx=obj.maChuyenXe;
                        Get.to(() => SelectChair(
                    maChuyenXe: obj.maChuyenXe,
                    nhaxe: obj.nhaXe,
                    noidi: obj.tenBxDi,
                    noiden: obj.tenBxDen,
                    giodi: obj.ngayXuatBen,
                    gioden: obj.ngayDen,
                    giatien: obj.donGia,
                    day: controllersearch.day.value,
                  ));});
                }),
      ),
      /*child: Padding(
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
                                                .listsearch[index].nhaXe,
                                            noidi: controllersearch
                                                .listsearch[index].tenBxDi,
                                            noiden: controllersearch
                                                .listsearch[index].tenBxDen,
                                            giodi: controllersearch
                                                .listsearch[index].ngayXuatBen,
                                            gioden: controllersearch
                                                .listsearch[index].ngayDen,
                                            giatien: controllersearch
                                                .listsearch[index].donGia,
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
                                                    .listsearch[index].ngayXuatBen,
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
                                                    .listsearch[index].ngayDen,
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
                                                    .listsearch[index].tenBxDi,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.blue),
                                              ),
                                              Icon(Icons.arrow_right_alt_sharp),
                                              Text(
                                                controllersearch
                                                    .listsearch[index].tenBxDen,
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
                                                " ${controllersearch.listsearch[index].nhaXe}   ",
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
                                            "Giá tiền: ${controllersearch.listsearch[index].donGia}đ",
                                            style: AppThemes.Text16,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Text(
                                            "Còn: ${controllersearch.listsearch[index].soChoTrong} ghế trống",
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
        ),*/
    );
  }
}
