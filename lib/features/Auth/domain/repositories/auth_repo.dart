import 'package:dartz/dartz.dart';
import 'package:twekl_test_app/core/exceptions.dart';

import '../entities/login_response_entity.dart';

abstract class BaseAuthRepo {
  Future<Either<GeneralExceptionClass, LoginResponseEntity>> login({
    required String userName,
    required String password,
  });
}
