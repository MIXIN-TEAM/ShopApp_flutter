import 'package:get/get.dart';
import 'package:shop_app_mixin/core/network_viewModel.dart';
import 'package:shop_app_mixin/core/viewmodel/auth_view_model.dart';
import 'package:shop_app_mixin/core/viewmodel/cart_view_model.dart';
import 'package:shop_app_mixin/core/viewmodel/checkout_viewmodel.dart';
import 'package:shop_app_mixin/core/viewmodel/control_view_model.dart';
import 'package:shop_app_mixin/core/viewmodel/home_view_model.dart';
import 'package:shop_app_mixin/helper/local_storage_data.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => LocalStorageUser());
    Get.lazyPut(() => NetworkViewModel());
    Get.lazyPut(() => CheckoutViewModel());
  }
}
