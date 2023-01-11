import 'package:dartz/dartz.dart';
import 'package:twekl_test_app/core/exceptions.dart';
import 'package:twekl_test_app/features/Auth/domain/entities/login_response_entity.dart';

import '../repositories/auth_repo.dart';

class LoginUseCase {
  final BaseAuthRepo baseAuthRepo;

  LoginUseCase(this.baseAuthRepo);
  Future<Either<GeneralExceptionClass, LoginResponseEntity>> call({
    required String userName,
    required String password,
  }) async {
    return baseAuthRepo.login(userName: userName, password: password);
  }
}
