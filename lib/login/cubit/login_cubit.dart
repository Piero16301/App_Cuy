import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._userRepository) : super(const LoginState());

  final UserRepository _userRepository;

  Future<void> loadSystemAuth() async {
    emit(state.copyWith(systemStatus: SystemStatus.loading));
    try {
      await _userRepository.systemAuthenticate();
      emit(
        state.copyWith(
          systemStatus: SystemStatus.success,
          formKey: GlobalKey<FormState>(),
        ),
      );
    } catch (e) {
      emit(state.copyWith(systemStatus: SystemStatus.failure));
    }
  }

  void restartStatus() {
    emit(state.copyWith(status: LoginStatus.initial));
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void userChanged(String user) {
    emit(state.copyWith(user: user));
  }

  void passwordChanged(String password) {
    emit(state.copyWith(password: password));
  }

  Future<void> login() async {
    if (!state.formKey!.currentState!.validate()) {
      return;
    }

    emit(state.copyWith(status: LoginStatus.loading));
    try {
      await _userRepository.login(state.user, state.password);
      emit(state.copyWith(status: LoginStatus.success));
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.failure));
    }
  }
}
