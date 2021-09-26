import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app_mixin/constance.dart';
import 'package:shop_app_mixin/model/user_model.dart';

class LocalStorageData extends GetxController {
  Future<UserModel?> get getUser async {
    try {
      UserModel userModel = await _getUserData();
      // ignore: unnecessary_null_comparison
      if (userModel == null) {
        return null;
      }
      return userModel;
    } catch (e) {
      print(
        e.toString(),
      );
      return null;
    }
  }

  _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(CACHED_USER_DATA);
    return UserModel.fromJson(
      json.decode(
        value!,
      ),
    );
  }

  setUser(UserModel usermodel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      CACHED_USER_DATA,
      jsonEncode(
        usermodel.toJson(),
      ),
    );
  }

  void deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
