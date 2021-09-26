import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_app_mixin/core/services/database/cart_database_helper.dart';
import 'package:shop_app_mixin/model/cart_product_model.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;

  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> _cartProductModel = [];

  List<CartProductModel> get cartProductModel => _cartProductModel;

  double get totalPrice => _totalPrice;
  double _totalPrice = 0;
  var dbHelper = CartDatabaseHelper.db;

  CartViewModel() {
    getAllProducts();
  }
  getAllProducts() async {
    _loading.value = true;
    var dbHelper = CartDatabaseHelper.db;
    _cartProductModel = await dbHelper.getAllProducts();
    _loading.value = false;
    getTotalPrice();
    update();
  }

  getTotalPrice() {
    for (var i = 0; i < _cartProductModel.length; i++) {
      _totalPrice += (double.parse(_cartProductModel[i].price) *
          _cartProductModel[i].quantity);
      update();
    }
  }

  addProduct(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartProductModel.productId) {
        return;
      }
    }
    dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    _totalPrice +=
        (double.parse(cartProductModel.price) * cartProductModel.quantity);
    update();
  }

  increaseQuantity(int index) async {
    _cartProductModel[index].quantity++;
    _totalPrice += (double.parse(
      cartProductModel[index].price,
    ));
    await dbHelper.updateProduct(
      _cartProductModel[index],
    );
    update();
  }

  decreaseQuantity(int index) async {
    _cartProductModel[index].quantity--;
    _totalPrice -= (double.parse(
      cartProductModel[index].price,
    ));
    await dbHelper.updateProduct(
      _cartProductModel[index],
    );
    update();
  }
}
