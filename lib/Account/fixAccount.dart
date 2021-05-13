import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Controller/controller.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';

class FixAccount extends StatefulWidget {
  @override
  _FixAccountState createState() => _FixAccountState();
}

class _FixAccountState extends State<FixAccount> {
  late String name,phone,address,cmnd;
  Controller controllerfix = Get.put(Controller());
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
                Navigator.pop(context);
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      controllerfix.inforAccount[0]=value;
                    } else {
                      name=value;
                    }
                  },
                  style: AppThemes.Text14,
                  decoration: InputDecoration(
                    labelText:  "Họ tên: ${controllerfix.inforAccount[0]}",
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      controllerfix.inforAccount[1]=value;
                    } else {
                      phone = value;
                    }
                  },
                  style: AppThemes.Text14,
                  decoration: InputDecoration(
                    labelText: "SDT: ${controllerfix.inforAccount[1]}",
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      controllerfix.inforAccount[2]=value;
                    } else {
                    address = value;
                    }
                  },
                  style: AppThemes.Text14,
                  decoration: InputDecoration(
                    labelText:"Địa chỉ: ${controllerfix.inforAccount[2]}",
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
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      controllerfix.inforAccount[3]=value;
                    } else {
                      cmnd = value;
                    }
                  },
                  style: AppThemes.Text14,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.credit_card_sharp),
                    labelText: "(CMND): ${controllerfix.inforAccount[3]}",
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

  }
}
