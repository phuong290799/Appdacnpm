
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Login/login.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String _name = "Phương";
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
                        offset: Offset(4,8),
                      )
                    ]

                  ),
                  child:Center(
                    child: Row(
                      children: [
                        SizedBox(width: 20,),
                        Icon(
                          Icons.account_circle,
                          size: 50,
                          color: AppColors.scaffold,
                        ),
                        Text(
                          "Chào bạn ",
                          style: AppThemes.text30container
                        ),
                        Expanded(child: SizedBox()),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              border: Border.all(width: 3,color: Colors.black)
                          ),

                          child: IconButton(
                            icon: const Icon(
                              Icons.edit_outlined,
                              size: 40,
                              color: Colors.black,
                            ),
                            onPressed: _fix,

                          ),
                        ),
                        SizedBox(width: 20,),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.credit_card_sharp,
                            size: 40,
                            color: AppColors.background,
                          ),
                          TextButton(
                            child: Text(
                              "Quản lý thẻ",
                                style: AppThemes.Text20
                            ),
                            onPressed: _quanly,
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.event_note,
                            size: 40,
                            color: AppColors.background,
                          ),
                          TextButton(
                            child: Text(
                              "Đánh giá chuyến đi",
                                style: AppThemes.Text20
                            ),
                            onPressed: _danhgia,
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [

                          Icon(
                            Icons.language,
                            size: 40,
                            color: AppColors.background,
                          ),

                          TextButton(
                            child: Text(
                              "Ngôn ngữ",
                                style: AppThemes.Text20
                            ),
                            onPressed: _ngonngu,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.markunread_outlined ,
                            size: 40,
                            color: AppColors.background,
                          ),

                          TextButton(
                            child: Text(
                              "Góp ý",
                              style: AppThemes.Text20
                            ),
                            onPressed: _gopy,
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
                  SizedBox(height: 50,),
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
  }
  void _quanly() {}
  void _ngonngu() {}
  void _gopy() {}
  void _danhgia(){}
  void _signout() {
    Get.off(Login());

  }
}
