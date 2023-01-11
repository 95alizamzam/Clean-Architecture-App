import 'package:twekl_test_app/features/Auth/domain/entities/login_response_entity.dart';

class LoginResponseModel extends LoginResponseEntity {
  const LoginResponseModel(super.token);

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(json['token']);
  }
}
