import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_app_mixin/core/viewmodel/auth_view_model.dart';
import 'package:shop_app_mixin/view/auth/login_screen%20.dart';
import 'package:shop_app_mixin/view/auth/register_screen.dart';
import 'package:shop_app_mixin/view/widgets/social_button.dart';

class WelcomScreen extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF437EAA),
            Color(0xFF2E9AEB),
          ],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.h),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Shop',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 53.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'discover your world',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      'Welcome to shop!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 29.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    SocialButton(
                      social: 'google',
                      text: 'Sign In with Google',
                      onPressed: () {
                        controller.googleSignInMethod();
                      },
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    SocialButton(
                      social: 'facebook',
                      text: 'Sign In with Facebook',
                      onPressed: () {
                        controller.facebookSignInMethod();
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.white,
                            height: 10.h,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'or',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.white,
                            height: 10.h,
                            endIndent: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(
                          RegisterScreen(),
                        );
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            9.r,
                          ),
                        ),
                        minimumSize: Size(
                          180.w,
                          50.h,
                        ),
                        side: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'Create a new account',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 17.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    Text(
                      'already have an account',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          LoginScreen(),
                        );
                      },
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
