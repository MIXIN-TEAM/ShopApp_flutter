class CartProductModel {
  late String name, image, price, productId;
  late int quantity;

  CartProductModel({
    required this.name,
    required this.image,
    required this.price,
    required this.productId,
    this.quantity = 1,
  });

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
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
