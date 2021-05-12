import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Account/fixAccount.dart';
import 'package:ticketapp/Account/setting.dart';
import 'package:ticketapp/Home/bottom_nav_bar.dart';
import 'package:ticketapp/Home/bottomnav.dart';
import 'package:ticketapp/Home/homePage.dart';
import 'package:ticketapp/Login/login.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {

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
                //  Get.to(()=>BottomNavBar());
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
              Text("Tài khoản", style: AppThemes.Text20Medium),
              SizedBox(
                width: 50,
              ),
            ],
          ),
          backgroundColor: AppColors.scaffold,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          // constraints: BoxConstraints.expand(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 15,
                          color: AppColors.shadow,
                          offset: Offset(4, 8),
                        )
                      ]),
                  child: Center(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.account_circle,
                          size: 50,
                          color: AppColors.scaffold,
                        ),
                        Text("Chào bạn ", style: AppThemes.text30container),
                        Expanded(child: SizedBox()),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              border:
                                  Border.all(width: 3, color: Colors.black)),
                          child: IconButton(
                            icon: const Icon(
                              Icons.edit_outlined,
                              size: 40,
                              color: Colors.black,
                            ),
                            onPressed: _fix,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: _quanly,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColors.scaffold,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 15,
                                  color: AppColors.shadow,
                                  offset: Offset(4, 8),
                                )
                              ]),
                          child: Row(
                            children: [
                              Icon(
                                Icons.manage_accounts,
                                size: 30,
                                color: AppColors.background,
                              ),
                              SizedBox(width: 10,),
                              Text("Quản lý thẻ", style: AppThemes.Text20),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: _danhgia,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColors.scaffold,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 15,
                                  color: AppColors.shadow,
                                  offset: Offset(4, 8),
                                )
                              ]),
                          child: Row(
                            children: [
                              Icon(
                                Icons.event_note,
                                size: 30,
                                color: AppColors.background,
                              ),
                              SizedBox(width: 10,),
                              Text("Đánh giá chuyến đi",
                                  style: AppThemes.Text20),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: _thietlap,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColors.scaffold,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 15,
                                  color: AppColors.shadow,
                                  offset: Offset(4, 8),
                                )
                              ]),
                          child: Row(
                            children: [
                              Icon(
                                Icons.settings,
                                size: 30,
                                color: AppColors.background,
                              ),
                              SizedBox(width: 10,),
                              Text("Thiết lập", style: AppThemes.Text20),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: _gopy,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColors.scaffold,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 15,
                                  color: AppColors.shadow,
                                  offset: Offset(4, 8),
                                )
                              ]),
                          child: Row(
                            children: [
                              Icon(
                                Icons.markunread_outlined,
                                size: 30,
                                color: AppColors.background,
                              ),
                              SizedBox(width: 10,),
                              Text("Góp ý", style: AppThemes.Text20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                RaisedButton(
                  onPressed: _signout,
                  color: AppColors.background,
                  child: Container(
                    width: 250,
                    height: 40,
                    child: Center(
                      child: Text(
                        "Đăng xuất",
                        style: AppThemes.text18container,
                      ),
                    ),
                  ),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide:
                          BorderSide(color: AppColors.background, width: 1)),
                ),
              ],
            ),
          ),
        ));
  }

  void _fix() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => FixAccount(),));
   // Get.to(() => FixAccount());
  }

  void _quanly() {}
  void _thietlap() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Setting(),));
  }

  void _gopy() {}
  void _danhgia() {}

  void _signout() {
    Get.off(Login());
  }
}
