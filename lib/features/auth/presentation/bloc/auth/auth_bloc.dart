import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:chat_app/features/auth/domain/usecases/login_use_case.dart';
import 'package:chat_app/features/auth/domain/usecases/register_use_case.dart';
import 'package:meta/meta.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  final _storage = const FlutterSecureStorage();
  AuthBloc({required this.registerUseCase, required this.loginUseCase})
      : super(AuthInitial()) {
    on<RegisterEvent>(
      (event, emit) async {
        emit(AuthLoading());
        try {
          await registerUseCase.call(
            event.username,
            event.email,
            event.password,
          );
          emit(AuthSuccess(message: "Registration success.."));
        } catch (e) {
          emit(AuthFailure(message: "Register failed ${e.toString()}"));
        }
      },
    );

    on<LoginEvent>(
      (event, emit) async {
        emit(AuthLoading());
        try {
          final user = await loginUseCase.call(event.email, event.password);
          await _storage.write(key: "token", value: user.token);

          emit(AuthSuccess(message: "Login success"));
        } catch (e) {
          emit(AuthFailure(message: "login failed : ${e.toString()}"));
        }
      },
    );
  }
}
