import 'package:dartz/dartz.dart';
import 'package:twekl_test_app/core/exceptions.dart';
import 'package:twekl_test_app/core/network.dart';
import 'package:twekl_test_app/core/sl.dart';
import 'package:twekl_test_app/features/Home/data/models/categories.dart';
import 'package:twekl_test_app/features/Home/data/models/products.dart';

abstract class BaseHomeRemoteDataSource {
  Future<Either<GeneralExceptionClass, List<ProductModel>>> getProducts();
  Future<Either<GeneralExceptionClass, CategoriesModel>> getCategories();
}

class HomeRemoteDataSourceImpl implements BaseHomeRemoteDataSource {
  @override
  Future<Either<GeneralExceptionClass, List<ProductModel>>>
      getProducts() async {
    final dio = sl<DioClass>();
    try {
      final result = await dio.get(endPoint: '/products');
      final List<ProductModel> products =
          List.from(result).map((e) => ProductModel.fromJson(e)).toList();

      return Right(products);
    } on GeneralExceptionClass catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<GeneralExceptionClass, CategoriesModel>> getCategories() async {
    final dio = sl<DioClass>();
    try {
      final result = await dio.get(endPoint: '/products/categories');
      final CategoriesModel categories = CategoriesModel.fromJson(result);

      return Right(categories);
    } on GeneralExceptionClass catch (e) {
      return left(e);
    }
  }
}
