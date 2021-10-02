import 'package:flutter/cupertino.dart';
import 'package:shop_app_mixin/helper/extension.dart';

class ProductModel {
  late String name, image, description, size, price, productId, category;
  late Color color;
  ProductModel({
    required this.name,
    required this.image,
    required this.price,
    required this.color,
    required this.size,
    required this.description,
    required this.productId,
    required this.category,
  });

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    name = map['name'];
    image = map['image'];
    price = map['price'];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
    size = map['size'];
    productId = map['productId'];
    category = map['category'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'description': description,
      'color': color,
      'size': size,
      'productId': productId,
      'category': category,
    };
  }
}
