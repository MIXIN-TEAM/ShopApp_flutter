import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_app_mixin/constance.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app_mixin/core/viewmodel/auth_view_model.dart';
import 'package:shop_app_mixin/view/widgets/text_field_container.dart';
import 'package:shop_app_mixin/view/widgets/validation_button.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp),
          color: Kprimarycolor,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.h),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/svg/LogIn.svg',
                  width: 174,
                  height: 193,
                ),
                Text(
                  "LOGIN",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 31.sp,
                    letterSpacing: -2,
                    color: Kprimarycolor,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  'Login to continue',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Kprimarycolor,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFieldContainer(
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Email...',
                  onSaved: (value) {
                    controller.email = value!;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('Error');
                    }
                  }, obscureText: false,
                ),
                SizedBox(
                  height: 11.h,
                ),
                TextFieldContainer(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  hintText: 'Password...',
                  onSaved: (value) {
                    controller.password = value!;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('Error');
                    }
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: KtextColor,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ValidationButton(
                   'Login',
                 () {
                    _formkey.currentState!.save();
                    if (_formkey.currentState!.validate()) {
                      controller.signInWithEmailAndPassword();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
