import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference<Map<dynamic, dynamic>> _categoryCollectionRef =
      FirebaseFirestore.instance.collection('Category');
  final CollectionReference<Map<dynamic, dynamic>> _productCollectionRef =
      FirebaseFirestore.instance.collection('Products');

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionRef.get();

    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getBestselling() async {
    var value = await _productCollectionRef.get();
    return value.docs;
  }
}
