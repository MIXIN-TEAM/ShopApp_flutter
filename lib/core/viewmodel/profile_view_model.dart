import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_app_mixin/helper/local_storage_data.dart';
import 'package:shop_app_mixin/model/user_model.dart';

class ProfileViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  final LocalStorageData localStorageData = Get.put(LocalStorageData());

  UserModel get userModel => _userModel;
  late UserModel _userModel;

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  void getCurrentUser() async {
    _loading.value = true;
    await localStorageData.getUser.then(
      (value) {
        _userModel = value!;
        print('lha9na lahna kho');
      },
    );
    _loading.value = false;
    update();
  }

  Future<void> singOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }
}
