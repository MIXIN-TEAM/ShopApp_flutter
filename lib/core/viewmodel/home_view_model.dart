import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shop_app_mixin/core/services/home_service.dart';
import 'package:shop_app_mixin/model/category_model.dart';
import 'package:shop_app_mixin/model/product_model.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];

  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];

  HomeViewModel() {
    getCategory();
    getBestSellingProducts();
  }
  getCategory() async {
    _loading.value = true;
    await HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(
          CategoryModel.fromJson(
            value[i].data() as Map<String, dynamic>,
          ),
        );

        _loading.value = false;
      }
      update();
    });
  }

  getBestSellingProducts() async {
    _loading.value = true;
    HomeService().getBestselling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(
          ProductModel.fromJson(
            value[i].data() as Map<String, dynamic>,
          ),
        );
        _loading.value = false;
      }

      update();
    });
  }
}
