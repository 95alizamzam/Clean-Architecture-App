import 'package:twekl_test_app/features/Home/data/datasources/remote_ds.dart';
import 'package:twekl_test_app/features/Home/domain/entities/category.dart';
import 'package:twekl_test_app/features/Home/domain/entities/product.dart';
import 'package:twekl_test_app/core/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:twekl_test_app/features/Home/domain/repositories/home_repo.dart';

class HomeRepoImpl implements BaseHomeRepository {
  final BaseHomeRemoteDataSource dataSource;

  HomeRepoImpl(this.dataSource);
  @override
  Future<Either<GeneralExceptionClass, List<ProductEntity>>>
      getProducts() async => await dataSource.getProducts();

  @override
  Future<Either<GeneralExceptionClass, CategoryEntity>> getCategories() async {
    return await dataSource.getCategories();
  }
}
