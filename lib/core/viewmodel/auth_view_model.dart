import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_app_mixin/core/services/firestore_user.dart';
import 'package:shop_app_mixin/helper/local_storage_data.dart';
import 'package:shop_app_mixin/model/user_model.dart';
import 'package:shop_app_mixin/view/control_view.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;

  late final String email, password, name;

  Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;

  final LocalStorageData localStorageData = Get.find();
  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    if (_auth.currentUser != null) {
      getCurrrentUserData(_auth.currentUser!.uid);
    }
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    await _auth.signInWithCredential(credential).then(
      (user) {
        saveUser(user);
        Get.offAll(
          () => ControlView(),
        );
      },
    );
  }

  void facebookSignInMethod() async {
    final LoginResult result = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken!.token);

    await _auth.signInWithCredential(facebookAuthCredential).then(
      (user) {
        saveUser(user);
        Get.offAll(
          () => ControlView(),
        );
      },
    );
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then(
        (value) async {
          getCurrrentUserData(value.user!.uid);
        },
      );
      Get.offAll(() => ControlView());
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error Login Account',
        'Error',
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createUserWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then(
        (user) async {
          saveUser(user);
        },
      );

      Get.offAll(
        () => ControlView(),
      );
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error Login Account',
        'Error',
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user!.uid,
      email: user.user!.email,
      name: user.user!.displayName,
      pic: '',
    );
    await FireStoreUser().addUserToFireStore(userModel);
    setUser(userModel);
  }

  void getCurrrentUserData(String uid) async {
    await FireStoreUser().getCurrentUser(uid).then(
      (value) {
        setUser(
          UserModel.fromJson(
            value.data() as Map<String, dynamic>,
          ),
        );
      },
    );
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }
}
