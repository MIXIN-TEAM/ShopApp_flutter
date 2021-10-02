import 'package:get/get.dart';
import 'package:shop_app_mixin/core/services/database/local_database_cart.dart';
import 'package:shop_app_mixin/model/cart_product_model.dart';

class CartViewModel extends GetxController {
  // ValueNotifier<bool> get loading => _loading;

  // ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> _cartProductModel = [];

  List<CartProductModel> get cartProductModel => _cartProductModel;

  double get totalPrice => _totalPrice;
  double _totalPrice = 0;

  var dbHelper = CartDatabaseHelper.db;

  @override
  void onInit() {
    super.onInit();
    getCartProducts();
  }

  getCartProducts() async {
    
    _cartProductModel = await dbHelper.getAllProducts();
    
    getTotalPrice();
    update();
  }

  removeProduct(String productId) async {
    await dbHelper.deleteProduct(productId);
    getCartProducts();
  }

  removeAllProducts() async {
    await dbHelper.deleteAllProducts();
    getCartProducts();
   
  }

  getTotalPrice() {
    _totalPrice = 0;
    _cartProductModel.forEach((cartProduct) {
      _totalPrice += (double.parse(cartProduct.price) * cartProduct.quantity);
    });
    update();
  }

  addProduct(CartProductModel cartProductModel) async {
    bool _isExist = false;
    _cartProductModel.forEach((element) {
      if (element.productId == cartProductModel.productId) {
        _isExist = true;
      }
    });
    if (!_isExist) {
      await dbHelper.insert(cartProductModel);
      getCartProducts();
    }
    update();
  }

  increaseQuantity(int index) async {
    _cartProductModel[index].quantity++;
    getTotalPrice();
    await dbHelper.updateProduct(
      _cartProductModel[index],
    );
    update();
  }

  decreaseQuantity(int index) async {
    if (_cartProductModel[index].quantity != 0) {
      _cartProductModel[index].quantity--;
      getTotalPrice();
    }

    _totalPrice -= (double.parse(
      cartProductModel[index].price,
    ));
    await dbHelper.updateProduct(
      _cartProductModel[index],
    );
    update();
  }
}
