import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ticketapp/constant/colors.dart';
import 'package:ticketapp/constant/styles.dart';
import 'package:ticketapp/screen/login/login.dart';
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds:3000), () {
      setState(() {
       Get.off(()=>Login());
      });

    });
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: Size(393, 825),
      orientation: Orientation.portrait,
    );
    return Scaffold(
      body: Container(
      color: AppColors.background,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Chào mừng bạn đến với ứng dụng đặt vé xe",style: TextStyle(fontSize: 30,color: AppColors.pink),
            textAlign: TextAlign.center,),
            SizedBox(height: 50.h,),
            Image.asset("assets/images/bus.png",height: 300),
          ],
        ),
      ),
      ),

    );

  }
}
