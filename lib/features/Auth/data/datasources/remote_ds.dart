import 'package:dartz/dartz.dart';
import 'package:twekl_test_app/core/exceptions.dart';
import 'package:twekl_test_app/core/network.dart';
import 'package:twekl_test_app/features/Auth/data/models/login_response_model.dart';

import '../../../../core/sl.dart';

abstract class AuthRemoteDataSource {
  Future<Either<GeneralExceptionClass, LoginResponseModel>> login({
    required String userName,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<Either<GeneralExceptionClass, LoginResponseModel>> login({
    required String userName,
    required String password,
  }) async {
    final dio = sl<DioClass>();
    try {
      final result = await dio.post(
        endPoint: '/auth/login',
        body: {
          "username": userName,
          "password": password,
        },
      );

      final LoginResponseModel loginModel = LoginResponseModel.fromJson(result);
      return Right(loginModel);
    } on GeneralExceptionClass catch (e) {
      return Left(e);
    }
  }
}
