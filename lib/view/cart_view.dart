import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shop_app_mixin/constance.dart';
import 'package:shop_app_mixin/core/viewmodel/cart_view_model.dart';
import 'package:shop_app_mixin/view/checkout_view.dart';
import 'package:shop_app_mixin/view/widgets/validation_button.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: Get.put(CartViewModel()),
      builder: (controller) => Scaffold(
        // backgroundColor: Color(0x4DC4C4C4),
        backgroundColor: Color(0xFFEEEEEE),
        body: controller.cartProductModel.length == 0
            ? Scaffold(
                backgroundColor: Color(0xFFEEEEEE),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/empty.svg',
                        height: 250.h,
                        width: 250.w,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'Empty cart',
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w600,
                          color: Kprimarycolor,
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.03,
                        top: MediaQuery.of(context).size.width * 0.03,
                      ),
                      color: Color(0x4DC4C4C4),
                      child: ListView.separated(
                        itemCount: controller.cartProductModel.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Dismissible(
                            key: Key(
                                controller.cartProductModel[index].productId),
                            background: Container(
                              color: Colors.red,
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right: 33.w),
                              child: Icon(
                                Icons.delete_forever,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            onDismissed: (direction) {
                              if (direction == DismissDirection.endToStart) {
                                controller.removeProduct(controller
                                    .cartProductModel[index].productId);
                              }
                            },
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      28.r,
                                    ),
                                  ),
                                  width: 120.h,
                                  height: 120.h,
                                  child: Image.network(
                                    controller.cartProductModel[index].image,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10.w,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        constraints:
                                            BoxConstraints(maxWidth: 200),
                                        child: Text(
                                          controller
                                              .cartProductModel[index].name,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Ksecondarycolor,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        controller.cartProductModel[index].price
                                                .toString() +
                                            ' DZD',
                                        style: TextStyle(
                                          color: Kprimarycolor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        width: 100.w,
                                        height: 26.h,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                controller
                                                    .increaseQuantity(index);
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: Ksecondarycolor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Text(
                                              controller.cartProductModel[index]
                                                  .quantity
                                                  .toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                controller
                                                    .decreaseQuantity(index);
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                color: Ksecondarycolor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 5.h,
                          );
                        },
                      ),
                    ),
                  ),
                  Material(
                    elevation: 12,
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total:',
                                style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                ),
                              ),
                              GetBuilder<CartViewModel>(
                                // init: Get.find(),
                                init: Get.put(CartViewModel()),
                                builder: (controller) => Text(
                                  '${controller.totalPrice} DZD',
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Kprimarycolor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ValidationButton(
                            'Check out',
                            () {
                              Get.to(() => CheckoutView());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
