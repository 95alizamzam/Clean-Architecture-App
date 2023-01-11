import 'package:dartz/dartz.dart';
import 'package:twekl_test_app/core/exceptions.dart';
import 'package:twekl_test_app/features/Home/domain/entities/product.dart';
import 'package:twekl_test_app/features/Home/domain/repositories/home_repo.dart';

class GetProductsUseCase {
  final BaseHomeRepository repo;

  GetProductsUseCase(this.repo);
  Future<Either<GeneralExceptionClass, List<ProductEntity>>> call() async {
    return await repo.getProducts();
  }
}
