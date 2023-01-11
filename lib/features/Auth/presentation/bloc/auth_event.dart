part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final String userName, password;

  const LoginEvent(this.userName, this.password);
  @override
  List<Object> get props => [userName, password];
}
