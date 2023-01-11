part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginDoneState extends AuthState {
  final String token;

  const LoginDoneState(this.token);

  @override
  List<Object> get props => [token];
}

class LoginFailedState extends AuthState {
  final String error;

  const LoginFailedState(this.error);

  @override
  List<Object> get props => [error];
}
