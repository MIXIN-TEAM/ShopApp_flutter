import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_app_mixin/constance.dart';

class CardsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Kprimarycolor,
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Cards',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Kprimarycolor,
          ),
        ),
      ),
      body: Center(
        child: Text(
          'You don\'t have cards.',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
