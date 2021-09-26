class CartProductModel {
  late String name, image, price, productId;
  late int quantity;
  CartProductModel({
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.productId,
  });

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    // ignore: unnecessary_null_comparison
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    price = map['price'];
    quantity = map['quantity'];
    productId = map['productId'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'productId': productId,
    };
  }
}
