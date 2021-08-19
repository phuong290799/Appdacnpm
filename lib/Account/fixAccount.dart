import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Controller/Chair_controller.dart';
import 'package:ticketapp/Controller/Home_controller.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';

class FixAccount extends StatefulWidget {
  @override
  _FixAccountState createState() => _FixAccountState();
}

class _FixAccountState extends State<FixAccount> {
  late String name,phone,address,cmnd;
  ChairController controllerfix = Get.put(ChairController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            Text("Cập nhật tài khoản", style: AppThemes.Text20Medium),
            SizedBox(
              width: 50,
            ),
          ],
        ),
        backgroundColor: AppColors.scaffold,

      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Container(
          padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.colors_icons,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadow.withOpacity(0.2),
                    blurRadius: 20,
                    offset: Offset(4,10),
                  )
                ]
            ),

          child: Form(

            key: formKey,
            child: Column(
              children: [
                TextFormField(
                 // controller: controllerfix.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                     // controllerfix.accountObj.tenNd=value;
                    } else {
                      name=value;
                    }
                  },
                  style: AppThemes.Text14,
                  decoration: InputDecoration(
                   // labelText:  "Họ tên: ${controllerfix.accountObj.tenNd}",
                    prefixIcon: Icon(Icons.person_add_alt_1_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                      BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  //controller: controllerfix.sdt,
                  validator: (value) {
                    if (value!.isEmpty) {
                    //  controllerfix.accountObj.sdt=value;
                    } else {
                      phone = value;
                    }
                  },
                  style: AppThemes.Text14,
                  decoration: InputDecoration(
                  //  labelText: "SDT: ${controllerfix.accountObj.sdt}",
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                      BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                 // controller: controllerfix.diachi,
                  validator: (value) {
                    if (value!.isEmpty) {
                   //   controllerfix.accountObj.diaChi=value;
                    } else {
                    address = value;
                    }
                  },
                  style: AppThemes.Text14,
                  decoration: InputDecoration(
                   // labelText:"Địa chỉ: ${  controllerfix.accountObj.diaChi}",
                    prefixIcon: Icon(Icons.location_on_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                      BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                 // controller: controllerfix.cmnd,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                   //   controllerfix.accountObj.cmnd=value;
                    } else {
                      cmnd = value;
                    }
                  },
                  style: AppThemes.Text14,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.credit_card_sharp),
                  //  labelText: "(CMND): ${ controllerfix.accountObj.cmnd}",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                      BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
                  child: RaisedButton(
                    onPressed: update,
                    color: AppColors.background,
                    child: Container(
                      width: 250,
                      height: 40,
                      child: Center(
                        child: Text(
                          "Cập nhật",
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

        ),
      ),
    );
  }
  void update(){
    if (formKey.currentState!.validate()) {
      updateAccount();
      Get.back();
    }
  }
  void updateAccount(){

    print("hhi");

    //controllerfix.apiUpdateInfo();
  }
}
