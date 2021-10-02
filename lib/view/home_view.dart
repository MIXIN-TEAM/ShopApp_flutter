import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_app_mixin/constance.dart';
import 'package:shop_app_mixin/core/viewmodel/home_view_model.dart';
import 'package:shop_app_mixin/view/category_products_view.dart';
import 'package:shop_app_mixin/view/details_view.dart';
import 'package:shop_app_mixin/view/search_view.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              // backgroundColor: Color(0x4DC4C4C4),
              backgroundColor: Color(0xFFEEEEEE),
              appBar: AppBar(
                backgroundColor: Color(0xFF4179A2),
                elevation: 0,
              ),
              body: SingleChildScrollView(
                padding: EdgeInsets.only(
                  top: 30.h,
                  bottom: 14.h,
                  right: 16.w,
                  left: 16.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _searchTextFormField(),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      'Categories',
                      style: TextStyle(
                        color: Color(0xFF33383A),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 19.h,
                    ),
                    _listViewCategory(),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Best Selling',
                          style: TextStyle(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              CategoryProductsView(
                                categoryName: 'Best Selling',
                                products: controller.productModel,
                              ),
                            );
                          },
                          child: Text(
                            'See all',
                            style: TextStyle(
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    _listViewProducts(),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      height: 49.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        color: Colors.white,
      ),
      child: TextFormField(
        onFieldSubmitted: (value) {
          Get.to(SearchView(value));
        },
        decoration: InputDecoration(
          hintText: 'search...',
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Kprimarycolor,
          ),
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 80.h,
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            width: 20.w,
          ),
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Get.to(CategoryProductsView(
                  categoryName: controller.categoryModel[index].name,
                  products: controller.productModel
                      .where((product) =>
                          product.category ==
                          controller.categoryModel[index].name.toLowerCase())
                      .toList(),
                ));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(50.r),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.white,
                      ),
                      height: 60.h,
                      width: 60.w,
                      child: Padding(
                        padding: EdgeInsets.all(12.h),
                        child: Image.network(
                          controller.categoryModel[index].image,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    controller.categoryModel[index].name,
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 320.h,
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            width: 15.w,
          ),
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Get.to(
                  () => DetailsView(
                    controller.productModel[index],
                  ),
                );
              },
              child: Container(
                width: 164.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        color: Colors.white,
                      ),
                      height: 220.h,
                      width: 164.w,
                      child: Image.network(
                        controller.productModel[index].image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      controller.productModel[index].name,
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      controller.productModel[index].description,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                      ),
                      maxLines: 1,
                    ),
                    Text(
                      'DZD${controller.productModel[index].price}',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Kprimarycolor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
