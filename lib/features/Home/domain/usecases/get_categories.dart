import 'package:dartz/dartz.dart';
import 'package:twekl_test_app/core/exceptions.dart';
import 'package:twekl_test_app/features/Home/domain/entities/category.dart';
import 'package:twekl_test_app/features/Home/domain/repositories/home_repo.dart';

class GetCategoriesUseCase {
  final BaseHomeRepository repo;

  GetCategoriesUseCase(this.repo);
  Future<Either<GeneralExceptionClass, CategoryEntity>> call() async {
    return await repo.getCategories();
  }
}
