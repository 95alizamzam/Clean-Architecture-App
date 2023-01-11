import 'package:twekl_test_app/features/Home/domain/entities/category.dart';

class CategoriesModel extends CategoryEntity {
  const CategoriesModel({required super.categories});

  factory CategoriesModel.fromJson(List<dynamic> json) {
    return CategoriesModel(
      categories: List.from(json).map<String>((e) => e).toList(),
    );
  }
}
