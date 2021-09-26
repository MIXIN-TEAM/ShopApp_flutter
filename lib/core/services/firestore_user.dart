import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_app_mixin/model/user_model.dart';

class FireStoreUser {
  final CollectionReference _usercollectionReference =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _usercollectionReference
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

  Future<DocumentSnapshot> getCurrentUser(String uid) async {
    return await _usercollectionReference.doc(uid).get();
  }
}
