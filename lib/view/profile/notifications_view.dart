import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_mixin/constance.dart';

class NotificationsView extends StatelessWidget {
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
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Kprimarycolor,
          ),
        ),
      ),
      body: Center(
        child: Text(
          'You don\'t have notifications right now.',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}