import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:twekl_test_app/features/Auth/domain/usecases/login_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  AuthBloc(
    this.loginUseCase,
  ) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoadingState());
        final response = await loginUseCase(
            userName: event.userName, password: event.password);
        response.fold(
          (l) => emit(LoginFailedState(l.errorMessage)),
          (r) => emit(LoginDoneState(r.token)),
        );
      }
    });
  }
}
