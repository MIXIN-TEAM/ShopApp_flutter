import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_mixin/constance.dart';
import 'package:shop_app_mixin/core/viewmodel/auth_view_model.dart';
import 'package:shop_app_mixin/view/widgets/text_field_container.dart';
import 'package:shop_app_mixin/view/widgets/validation_button.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Kprimarycolor,
                  ),
                ),
                Text(
                  'Let\'s create your profile',
                  style: TextStyle(
                    color: Kprimarycolor,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'With email address',
                  style: TextStyle(
                    color: Kprimarycolor,
                    fontWeight: FontWeight.w600,
                    fontSize: 19,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFieldContainer(
                      hintText: 'Name',
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        controller.name = value!;
                      },
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFieldContainer(
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) {
                        controller.email = value!;
                      },
                      validator: (value) {
                        if (value == null) {
                          print('Error');
                        }
                      },
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFieldContainer(
                      hintText: 'Password',
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        controller.password = value!;
                      },
                      validator: (value) {
                        if (value == null) {
                          print('Error');
                        }
                      },
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFieldContainer(
                      hintText: 'Confirm Password',
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        controller.password = value!;
                      },
                      validator: (value) {
                        if (value == null || value != controller.password) {
                          print('Error');
                        }
                      },
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'use phone number',
                          style: TextStyle(
                            color: Kprimarycolor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ValidationButton(
                      'Sign up',
                      () {
                        _formkey.currentState!.save();
                        if (_formkey.currentState!.validate()) {
                          controller.createUserWithEmailAndPassword();
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
