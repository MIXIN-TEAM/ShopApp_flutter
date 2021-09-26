import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_mixin/constance.dart';
import 'package:shop_app_mixin/core/viewmodel/profile_view_model.dart';
import 'package:shop_app_mixin/view/auth/welcome_screen.dart';
import 'package:shop_app_mixin/view/widgets/tile_list.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
        init: ProfileViewModel(),
        builder: (controller) => controller.loading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                body: SafeArea(
                  child: Container(
                    padding: EdgeInsets.only(left: 10, top: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.3,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                    image: DecorationImage(
                                      // ignore: unnecessary_null_comparison
                                      image: AssetImage(
                                        'assets/images/avatar.png',
                                      ),
                                      // controller.userModel.[] as ImageProvider,
                                      // == null
                                      //     ? AssetImage(
                                      //         'assets/images/avatar.png',
                                      //       )
                                      //     : controller.userModel.pic ==
                                      //             'default'
                                      //         ? AssetImage(
                                      //             'assets/images/avatar.png')
                                      //         : NetworkImage(
                                      //             controller.userModel.pic!,
                                      //           ) as ImageProvider,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.userModel.name == null
                                          ? 'user'
                                          : controller.userModel.name!,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Ksecondarycolor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      controller.userModel.email == null
                                          ? 'user'
                                          : controller.userModel.email!,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Ksecondarycolor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Tile(
                            image: 'assets/svg/edit.svg',
                            text: 'Edit Profile',
                          ),
                          Tile(
                            image: 'assets/svg/location.svg',
                            text: 'Shipping Address',
                          ),
                          Tile(
                            image: 'assets/svg/history.svg',
                            text: 'Order History',
                          ),
                          Tile(
                            image: 'assets/svg/card.svg',
                            text: 'Cards',
                          ),
                          Tile(
                            image: 'assets/svg/notification.svg',
                            text: 'Notifications',
                          ),
                          Tile(
                            image: 'assets/svg/logout.svg',
                            text: 'Log Out',
                            onPressed: () {
                              controller.singOut();
                              Get.offAll(
                                WelcomScreen(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
  }
}
