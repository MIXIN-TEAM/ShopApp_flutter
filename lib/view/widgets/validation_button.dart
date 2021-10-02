import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constance.dart';

class ValidationButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPress;
  ValidationButton(
    this.text,
    this.onPress,
  );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Kprimarycolor,
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            9.r,
          ),
        ),
        maximumSize: Size(
          180.w,
          50.h,
        ),
      ),
      onPressed: onPress,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 11.w,
          horizontal: MediaQuery.of(context).size.width * 0.1,
        ),
        child: Text(
          text!,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
