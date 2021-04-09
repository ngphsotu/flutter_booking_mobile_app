///Note file x_button.dart

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_booking_mobile_app/ui/color.dart';

///class MButton extends StatelessWidget
class MButton extends StatelessWidget {
  final String title; ///
  final Function onTap; ///
  final Color color; ///
  final double height; ///

  MButton(
      this.title,
      this.onTap,
      {this.height = 55, this.color = AppColors.buttonColor}
      );

  ///
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: height, ///Container height
        decoration: BoxDecoration(
            color: color, ///Color box
            borderRadius: BorderRadius.circular(10), ///Border box
        ),
        width: double.infinity,
        child: Center(
          child: Text(
            title.toUpperCase(), ///toUpperCase
            style: TextStyle(
                fontWeight: FontWeight.w700, ///Text weight
            ),
          ),
        ),
      ),
    );
  }
}
