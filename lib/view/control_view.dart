import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop_app_mixin/constance.dart';
import 'package:shop_app_mixin/core/network_viewModel.dart';
import 'package:shop_app_mixin/core/viewmodel/auth_view_model.dart';
import 'package:shop_app_mixin/core/viewmodel/control_view_model.dart';
import 'package:shop_app_mixin/view/auth/welcome_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ControlView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Get.find<AuthViewModel>().user == null
            ? WelcomScreen()
            : Get.find<NetworkViewModel>().connectionStatus.value == 1 ||
                    Get.find<NetworkViewModel>().connectionStatus.value == 2
                ? GetBuilder<ControlViewModel>(
                    init: ControlViewModel(),
                    builder: (controller) => Scaffold(
                      body: controller.currentScreen,
                      bottomNavigationBar: bottomNavigationBar(),
                    ),
                  )
                : NoInternetConnection();
      },
    );
  }
}

Widget bottomNavigationBar() {
  return GetBuilder<ControlViewModel>(
    init: ControlViewModel(),
    builder: (controller) => BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          activeIcon: Text(
            'Home',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Kprimarycolor),
          ),
          label: '',
          icon: SvgPicture.asset(
            'assets/svg/home.svg',
            fit: BoxFit.contain,
            width: 20.h,
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: Text(
            'cart',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Kprimarycolor),
          ),
          label: '',
          icon: SvgPicture.asset(
            'assets/svg/cart.svg',
            fit: BoxFit.contain,
            width: 20.h,
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: Text(
            'Profile',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Kprimarycolor),
          ),
          label: '',
          icon: SvgPicture.asset(
            'assets/svg/profile.svg',
            fit: BoxFit.contain,
            width: 20.h,
          ),
        ),
      ],
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.blue.shade600,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      currentIndex: controller.navigatorValue,
      onTap: (index) {
        controller.changeSelectedValue(index);
      },
      elevation: 0,
    ),
  );
}

class NoInternetConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 30.h,
            ),
            Text(
              'Please check your internet connection..',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
