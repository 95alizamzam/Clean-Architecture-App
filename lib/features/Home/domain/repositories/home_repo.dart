import 'package:dartz/dartz.dart';
import 'package:twekl_test_app/core/exceptions.dart';
import 'package:twekl_test_app/features/Home/domain/entities/category.dart';
import 'package:twekl_test_app/features/Home/domain/entities/product.dart';

abstract class BaseHomeRepository {
  Future<Either<GeneralExceptionClass, List<ProductEntity>>> getProducts();

  Future<Either<GeneralExceptionClass, CategoryEntity>> getCategories();
}
