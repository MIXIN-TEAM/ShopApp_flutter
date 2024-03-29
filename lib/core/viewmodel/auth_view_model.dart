import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_app_mixin/core/services/firestore_user.dart';
import 'package:shop_app_mixin/helper/local_storage_data.dart';
import 'package:shop_app_mixin/model/user_model.dart';
import 'package:shop_app_mixin/view/control_view.dart';

class AuthViewModel extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  String? email, password, name;

  Rxn<User>? _user = Rxn<User>();
  String? get user => _user?.value?.email;

  // final LocalStorageUser localStorageData = Get.find();
  @override
  void onInit() {
    super.onInit();
    _user!.bindStream(_auth.authStateChanges());
  }

  void googleSignInMethod() async {
    try {
      GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential).then((user) {
        saveUser(user);
      });
      Get.offAll(ControlView());
    } catch (error) {
      String errorMessage =
          error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Failed to login..',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
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
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then(
        (user) async {
          FireStoreUser().getCurrentUser(user.user!.uid).then((doc) {
            setUser(UserModel.fromJson(doc.data() as Map<dynamic, dynamic>));
          });
        },
      );
      Get.offAll(() => ControlView());
    } catch (error) {
      String errorMessage =
          error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Failed to login..',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createUserWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      )
          .then(
        (user) async {
          saveUser(user);
        },
      );

      Get.offAll(
        () => ControlView(),
      );
    } catch (error) {
      String errorMessage =
          error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Failed to login..',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential user) async {
    UserModel _userModel = UserModel(
      userId: user.user!.uid,
      email: user.user!.email!,
      name: name == null ? user.user!.displayName! : this.name!,
      pic: user.user!.photoURL == null
          ? 'default'
          : user.user!.photoURL! + "?width=400",
    );
    await FireStoreUser().addUserToFireStore(_userModel);
    setUser(_userModel);
  }

  // void getCurrrentUserData(String uid) async {
  //   await FireStoreUser().getCurrentUser(uid).then(
  //     (value) {
  //       setUser(
  //         UserModel.fromJson(
  //           value.data() as Map<String, dynamic>,
  //         ),
  //       );
  //     },
  //   );
  // }

  void singOut() async {
    try {
      await _auth.signOut();
      LocalStorageUser.deleteUser();
    } catch (e) {
      print(e);
    }
    // GoogleSignIn().signOut();
    // FirebaseAuth.instance.signOut();
    // LocalStorageUser.deleteUser();
  }

  void setUser(UserModel userModel) async {
    await LocalStorageUser.setUser(userModel);
  }
}
