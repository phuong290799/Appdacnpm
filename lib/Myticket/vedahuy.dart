
import 'package:flutter/material.dart';
import 'package:ticketapp/Theme/colors.dart';
class vedahuy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 20, 30, 220),
      child: Container(
        padding: EdgeInsets.fromLTRB(50,30,30,30),
        decoration: BoxDecoration(
            color: AppColors.scaffold,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black12,width: 2
            )
        ),
      ),
    );
  }
}
