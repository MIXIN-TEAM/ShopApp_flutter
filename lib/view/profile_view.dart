import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_app_mixin/constance.dart';
import 'package:shop_app_mixin/core/viewmodel/auth_view_model.dart';
import 'package:shop_app_mixin/core/viewmodel/profile_view_model.dart';
import 'package:shop_app_mixin/view/profile/cards_view.dart';
import 'package:shop_app_mixin/view/profile/edit_profile_view.dart';
import 'package:shop_app_mixin/view/profile/notifications_view.dart';
import 'package:shop_app_mixin/view/profile/order_history_view.dart';
import 'package:shop_app_mixin/view/widgets/tile_list.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: GetBuilder<ProfileViewModel>(
        init: ProfileViewModel(),
        builder: (controller) => controller.loading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 10.w,
                    top: 20.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: 40.h,
                          right: 16.w,
                          left: 16.w,
                        ),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 60.h,
                              backgroundImage:
                                  AssetImage('assets/images/avatar.png'),
                              foregroundImage: controller.currentUser!.pic !=
                                      'default'
                                  ? NetworkImage(controller.currentUser!.pic)
                                  : null,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  controller.currentUser!.name,
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Ksecondarycolor,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  controller.currentUser!.email,
                                  style: TextStyle(
                                    fontSize: 15.sp,
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
                        height: 50.h,
                      ),
                      Tile(
                        image: 'assets/svg/edit.svg',
                        text: 'Edit Profile',
                        onPressed: () => Get.to(() => EditProfileView()),
                      ),
                      Tile(
                        image: 'assets/svg/history.svg',
                        text: 'Order History',
                        onPressed: () => Get.to(() => OrderHistoryView()),
                      ),
                      Tile(
                        image: 'assets/svg/card.svg',
                        text: 'Cards',
                        onPressed: () => Get.to(() => CardsView()),
                      ),
                      Tile(
                        image: 'assets/svg/notification.svg',
                        text: 'Notifications',
                        onPressed: () => Get.to(() => NotificationsView()),
                      ),
                      Tile(
                        image: 'assets/svg/logout.svg',
                        text: 'Log Out',
                        onPressed: () {
                          Get.find<AuthViewModel>().singOut();
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
