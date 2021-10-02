import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop_app_mixin/constance.dart';
import 'package:shop_app_mixin/core/viewmodel/cart_view_model.dart';
import 'package:shop_app_mixin/model/cart_product_model.dart';
import 'package:shop_app_mixin/model/product_model.dart';
import 'package:shop_app_mixin/view/cart_view.dart';
import 'package:shop_app_mixin/view/widgets/validation_button.dart';


class DetailsView extends StatelessWidget {
  final ProductModel _model;
  DetailsView(this._model);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.height,
                    height: 250.h,
                    child: Image.network(
                      _model.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    right: 10.w,
                    top: 10.h,
                    child: IconButton(
                      color: Colors.black26,
                      onPressed: () => Get.to(CartView()),
                      icon: SvgPicture.asset('assets/svg/cart.svg'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(15.h),
                    child: Column(
                      children: [
                        Text(
                          _model.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 27.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.all(15.h),
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  20.r,
                                ),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Size',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    _model.size,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(15.h),
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Color',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                    height: 20,
                                    padding: EdgeInsets.all(10.h),
                                    decoration: BoxDecoration(
                                      color: _model.color,
                                      border: Border.all(
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        5.r,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Details',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          _model.description,
                          style: TextStyle(
                            fontSize: 15.sp,
                            height: 1.5,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price:',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        Text(
                          _model.price + ' \DZD',
                          style: TextStyle(
                            color: Kprimarycolor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    GetBuilder<CartViewModel>(
                      init: Get.put(CartViewModel()),
                      builder: (controller) => ValidationButton(
                        'Add',
                        () => controller.addProduct(
                          CartProductModel(
                            name: _model.name,
                            image: _model.image,
                            price: _model.price,
                            productId: _model.productId,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
