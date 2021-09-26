class CategoryModel {
  late String name, image;

  CategoryModel({
    required this.name,
    required this.image,
  });

  CategoryModel.fromJson(Map<dynamic, dynamic> map) {
    // ignore: unnecessary_null_comparison
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
    };
  }
}
