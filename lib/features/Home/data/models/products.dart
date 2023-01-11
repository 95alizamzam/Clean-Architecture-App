import 'package:twekl_test_app/features/Home/domain/entities/product.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.category,
    required super.description,
    required super.image,
    required super.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: double.parse(json['price'].toString()),
      category: json['category'],
      description: json['description'],
      image: json['image'],
      rating: Map.from(json['rating']).map(
        (key, value) => MapEntry(key, value),
      ),
    );
  }
}
