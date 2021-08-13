import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Account/account.dart';
import 'package:ticketapp/Controller/controller_theme.dart';
import 'package:ticketapp/Home/bottom_nav_bar.dart';
import 'package:ticketapp/Home/homePage.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  ControllerTheme controllerTheme = Get.put(ControllerTheme());
  late bool ontap = false;

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
               // Navigator.push(context, CupertinoPageRoute(
               //   builder: (context) =>Account(),));
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
            Text("Thiết lập", style: AppThemes.Text20Medium),
            SizedBox(
              width: 50,
            ),
          ],
        ),
        backgroundColor: AppColors.scaffold,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
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
                  Icon(
                    Icons.language,
                    color: AppColors.background,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Ngôn ngữ",
                    style: AppThemes.Text16,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      ontap = !ontap;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
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
                        Icon(
                          Icons.color_lens_outlined,
                          color: AppColors.background,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Text(
                          "Màu sắc",
                          style: AppThemes.Text16,
                        )),
                        ontap
                            ? Icon(
                                Icons.arrow_circle_down_sharp,
                                color: AppColors.background,
                              )
                            : Icon(
                                Icons.arrow_circle_up_sharp,
                                color: AppColors.background,
                              )
                      ],
                    ),
                  ),
                ),
                ontap
                    ? Container(
                  height: controllerTheme.listColors.length*54,
                      child: ListView.builder(
                      itemCount: controllerTheme.listColors.length,
                      itemBuilder: (context, index) {

                          return Container(
                            padding: EdgeInsets.only(top: 2, left: 15),
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                 AppColors.background =controllerTheme.listColors[index].colorsbackground;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                                    Expanded(
                                        child: Text(
                                     controllerTheme.listColors[index].namecolors,
                                      style: AppThemes.Text16,
                                    )),
                                    Container(
                                        height: 20,
                                        width: 50,
                                      color:  controllerTheme.listColors[index].colorsbackground,),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                    )
                    : Container(
                        height: 0,
                      ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(15),
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
                  Icon(
                    Icons.text_fields,
                    color: AppColors.background,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Cỡ chữ",
                    style: AppThemes.Text16,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50,bottom: 50),
              child: RaisedButton(
                onPressed: (){
                  Get.to(()=>BottomNavBar());
                },
                color: AppColors.background,
                child: Container(
                  width: 250,
                  height: 40,
                  child: Center(
                    child: Text(
                      "Lưu",
                      style: AppThemes.text18container,
                    ),
                  ),
                ),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide:
                    BorderSide(color: AppColors.background, width: 1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
