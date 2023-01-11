import 'package:twekl_test_app/core/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:twekl_test_app/features/Auth/domain/entities/login_response_entity.dart';
import 'package:twekl_test_app/features/Auth/domain/repositories/auth_repo.dart';

import '../datasources/remote_ds.dart';

class AuthRepoImpl implements BaseAuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl(this.authRemoteDataSource);
  @override
  Future<Either<GeneralExceptionClass, LoginResponseEntity>> login(
      {required String userName, required String password}) async {
    return authRemoteDataSource.login(userName: userName, password: password);
  }
}
