import 'package:flutter/material.dart';
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
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Shop',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 53,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'discover your world',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      'Welcome to shop!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 29,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    SocialButton(
                      social: 'google',
                      text: 'Sign In with Google',
                      onPressed: () {
                        controller.googleSignInMethod();
                      },
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    SocialButton(
                      social: 'facebook',
                      text: 'Sign In with Facebook',
                      onPressed: () {
                        controller.facebookSignInMethod();
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.white,
                            height: 10,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'or',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.white,
                            height: 10,
                            endIndent: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
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
                            9,
                          ),
                        ),
                        minimumSize: Size(
                          180,
                          50,
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
                            width: 10,
                          ),
                          Text(
                            'Create a new account',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Text(
                      'already have an account',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
                          fontSize: 20,
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
