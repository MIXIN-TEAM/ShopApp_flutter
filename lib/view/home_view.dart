import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shop_app_mixin/constance.dart';
import 'package:shop_app_mixin/core/viewmodel/home_view_model.dart';
import 'package:shop_app_mixin/view/details_view.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              backgroundColor: Color(0x4DC4C4C4),
              appBar: AppBar(
                backgroundColor: Color(0xFF4179A2),
                elevation: 0,
              ),
              body: SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 14,
                      right: 14,
                      left: 14,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _searchTextFormField(),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Categories',
                          style: TextStyle(
                            color: Color(0xFF33383A),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        _listViewCategory(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Best Selling',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'See all',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        _listViewProducts(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
      ),
      child: TextFormField(
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
        height: 80,
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            width: 20,
          ),
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: 50,
                  width: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      controller.categoryModel[index].image,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  controller.categoryModel[index].name,
                  //TODO:add text style
                  style: TextStyle(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 350,
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            width: 20,
          ),
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => DetailsView(
                          model: controller.productModel[index],
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 200,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Image.network(
                                controller.productModel[index].image,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.productModel[index].name,
                                      style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: 1,
                                    ),
                                    Text(
                                      controller
                                          .productModel[index].description,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey.shade600,
                                      ),
                                      maxLines: 1,
                                    ),
                                    Text(
                                      '${controller.productModel[index].price.toString()} DZD',
                                      style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF2E9AEB),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
}
