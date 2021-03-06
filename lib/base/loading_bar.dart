///Note file loading_bar.dart

import 'package:flutter/material.dart';
import 'package:flutter_booking_mobile_app/ui/color.dart';

///LoadingBar StatelessWidget
class LoadingBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      ///Container height
      height: MediaQuery.of(context).size.height,

      ///Container width
      width: MediaQuery.of(context).size.width,

      ///Container color
      color: Colors.grey.withOpacity(.3),

      child: Column(
        ///Using mainAxisAlignment in a Column will align its children vertically.
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          new CircularProgressIndicator(
            ///Background color
            backgroundColor: Colors.transparent,

            ///Value color
            valueColor:
                new AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            ///Text
            "Loading...",
            style: TextStyle(
              ///Text color
              color: AppColors.primaryColor,

              ///Text weight
              fontWeight: FontWeight.w600,

              ///Text spacing
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
