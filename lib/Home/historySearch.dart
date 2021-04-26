import 'package:flutter/material.dart';
import 'package:ticketapp/Theme/colors.dart';
class HistorySearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
          color: AppColors.scaffold,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: AppColors.shadow,
                blurRadius: 40,
                offset: Offset(2,10)
            )
          ]
      ),

    );
  }
}
