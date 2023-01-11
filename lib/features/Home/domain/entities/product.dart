import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String title, category, description, image;
  final double price;
  final Map<String, dynamic> rating;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
    required this.rating,
  });

  @override
  List<Object?> get props =>
      [id, title, price, category, description, image, rating];
}
