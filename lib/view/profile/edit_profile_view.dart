import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop_app_mixin/core/viewmodel/profile_view_model.dart';
import 'package:shop_app_mixin/core/viewmodel/select_image_viewmodel.dart';
import 'package:shop_app_mixin/view/widgets/text_field_container.dart';
import 'package:shop_app_mixin/view/widgets/validation_button.dart';

class EditProfileView extends StatefulWidget {
  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    String _loginMethod =
        FirebaseAuth.instance.currentUser!.providerData[0].providerId;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 130.h,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 24.h,
                left: 16.w,
                right: 16.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    width: 24,
                  ),
                ],
              ),
            ),
          ),
          GetBuilder<SelectImageViewModel>(
            init: SelectImageViewModel(),
            builder: (controller) => Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 16.w,
                    left: 16.w,
                    bottom: 24.h,
                  ),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.h),
                      child: _loginMethod == 'google.com' ||
                              _loginMethod == 'facebook.com'
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  _loginMethod == 'google.com'
                                      ? 'assets/svg/google.svg'
                                      : 'assets/svg/facebook.svg',
                                  fit: BoxFit.cover,
                                  height: 40.h,
                                  width: 40.h,
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Text(
                                  _loginMethod == 'google.com'
                                      ? 'You\'re logged in using Google account!'
                                      : 'You\'re logged in using Facebook account!',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            )
                          : Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 60.h,
                                        backgroundImage: AssetImage(
                                            'assets/images/avatar.png'),
                                        foregroundImage: controller.imageFile !=
                                                null
                                            ? FileImage(controller.imageFile!)
                                            : null,
                                      ),
                                      SizedBox(
                                        width: 40.w,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Get.dialog(
                                            AlertDialog(
                                              title: Text(
                                                'Choose option',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Divider(
                                                    height: 1,
                                                  ),
                                                  ListTile(
                                                    onTap: () async {
                                                      try {
                                                        await controller
                                                            .cameraImage();
                                                        Get.back();
                                                      } catch (error) {
                                                        Get.back();
                                                      }
                                                    },
                                                    title: Text(
                                                      'Camera',
                                                    ),
                                                    leading: Icon(
                                                      Icons.camera,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                  Divider(
                                                    height: 1,
                                                  ),
                                                  ListTile(
                                                    onTap: () async {
                                                      try {
                                                        await controller
                                                            .galleryImage();
                                                        Get.back();
                                                      } catch (error) {
                                                        Get.back();
                                                      }
                                                    },
                                                    title: Text(
                                                      'Gallery',
                                                    ),
                                                    leading: Icon(
                                                      Icons.account_box,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                        child: Text('Select Image'),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 38.h,
                                  ),
                                  TextFieldContainer(
                                    hintText: Get.find<ProfileViewModel>()
                                        .currentUser!
                                        .name,
                                    initialValue: Get.find<ProfileViewModel>()
                                        .currentUser!
                                        .name,
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 4)
                                        return 'Please enter valid name.';
                                    },
                                    onSaved: (value) {
                                      Get.find<ProfileViewModel>().name = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 38.h,
                                  ),
                                  Column(
                                    children: [
                                      TextFieldContainer(
                                        hintText: Get.find<ProfileViewModel>()
                                            .currentUser!
                                            .email,
                                        initialValue:
                                            Get.find<ProfileViewModel>()
                                                .currentUser!
                                                .email,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value!.isEmpty)
                                            return 'Please enter valid email address.';
                                        },
                                        onSaved: (value) {
                                          Get.find<ProfileViewModel>().email =
                                              value;
                                        },
                                      ),
                                      SizedBox(
                                        height: 38.h,
                                      ),
                                      TextFieldContainer(
                                        hintText: '',
                                        obscureText: true,
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              value.length < 6)
                                            return 'Please enter valid password with at least 6 characters.';
                                        },
                                        onSaved: (value) {
                                          Get.find<ProfileViewModel>()
                                              .password = value;
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 50.h,
                                  ),
                                  _isLoading
                                      ? CircularProgressIndicator()
                                      : ValidationButton(
                                          'SUBMIT',
                                          () async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              setState(() {
                                                _isLoading = true;
                                              });
                                              try {
                                                await controller
                                                    .uploadImageToFirebase();
                                                Get.find<ProfileViewModel>()
                                                    .picUrl = controller.picUrl;
                                              } catch (e) {
                                                Get.find<ProfileViewModel>()
                                                        .picUrl =
                                                    Get.find<ProfileViewModel>()
                                                        .currentUser!
                                                        .pic;
                                              }
                                              _formKey.currentState!.save();
                                              await Get.find<ProfileViewModel>()
                                                  .updateCurrentUser();
                                              setState(() {
                                                _isLoading = false;
                                              });
                                            }
                                          },
                                        ),
                                ],
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
