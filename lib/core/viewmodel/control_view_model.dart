import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_mixin/view/cart_view.dart';
import 'package:shop_app_mixin/view/home_view.dart';
import 'package:shop_app_mixin/view/profile_view.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;

  get navigatorValue => _navigatorValue;

  Widget currentScreen = HomeView();

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;

    switch (selectedValue) {
      case 0:
        {
          currentScreen = HomeView();
          break;
        }
      case 1:
        {
          currentScreen = CartView();
          break;
        }
      // case 2:
      //   {
      //     currentScreen = FavoriteView();
      //     break;
      //   }
      case 2:
        {
          currentScreen = ProfileView();
          break;
        }
    }
    update();
  }
}
