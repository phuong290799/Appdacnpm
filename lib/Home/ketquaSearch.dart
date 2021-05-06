
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Controller/controller.dart';
import 'package:ticketapp/Home/selectChair.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';


class KetquaSearch extends StatelessWidget {
 late String day;
  KetquaSearch({required this.day});
  Controller controllersearch =Get.put(Controller());
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
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.colors_icons,
              boxShadow: [
                BoxShadow(
              color: AppColors.shadow,
                  blurRadius: 20,
                  offset: Offset(4,10),
          )
              ]
          ),
          height: MediaQuery.of(context).size.height,
          child: controllersearch.listsearch.length!=0?
          ListView.builder(
            itemCount: controllersearch.listsearch.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  padding: EdgeInsets.only(left: 20,right: 20,),
                  margin: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.scaffold,
                    boxShadow: [
                    BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 20,
                    offset: Offset(4,10),
                  )
                    ]
                  ),
                  child:GestureDetector(
                    onTap: () {
                      Get.to(()=>SelectChair(noidi:controllersearch.listsearch[index].noidi,
                          noiden:controllersearch.listsearch[index].noiden,
                        nhaxe:controllersearch.listsearch[index].nhaxe,
                          giodi:controllersearch.listsearch[index].giodi,
                          gioden:controllersearch.listsearch[index].gioden,
                          giatien:controllersearch.listsearch[index].giatien,
                        day: day,

                      ));
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Ngày đi: $day",style: AppThemes.Text16,),
                                Text("Nhà xe: ${controllersearch.listsearch[index].nhaxe}",style: AppThemes.Text16,),
                                Row(
                                  children: [
                                    Text("Thời gian: ",style: AppThemes.Text16,),
                                    Text(controllersearch.listsearch[index].giodi,style: AppThemes.Text16Medium,),
                                    Icon(Icons.arrow_right_alt_sharp),
                                    Text(controllersearch.listsearch[index].gioden,style: AppThemes.Text16Medium,),
                                  ],
                                ),
                                Text("Giá tiền: ${controllersearch.listsearch[index].giatien}đ",style: AppThemes.Text16,),
                              ],
                            ),

                            Expanded(child: SizedBox()),
                            Image.asset("assets/images/khach2.png",height:100,width:150,fit: BoxFit.cover,),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.my_location,
                              size: 30,
                              color: AppColors.background,
                            ),
                            Text(controllersearch.listsearch[index].noidi,style: AppThemes.Text18Medium,),
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
                            Text(controllersearch.listsearch[index].noiden,style: AppThemes.Text18Medium,),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              );

            },
          ):Container(
            child: Center(child: Text("Vui lòng đợi hoặc thử lại!")),
          )
        ),
      ),
    );
  }
}
