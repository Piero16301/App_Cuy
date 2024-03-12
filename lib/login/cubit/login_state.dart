part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == LoginStatus.initial;
  bool get isLoading => this == LoginStatus.loading;
  bool get isSuccess => this == LoginStatus.success;
  bool get isFailure => this == LoginStatus.failure;
}

enum SystemStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == SystemStatus.initial;
  bool get isLoading => this == SystemStatus.loading;
  bool get isSuccess => this == SystemStatus.success;
  bool get isFailure => this == SystemStatus.failure;
}

class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.initial,
    this.systemStatus = SystemStatus.initial,
    this.formKey,
    this.user = '',
    this.password = '',
    this.isPasswordVisible = false,
  });

  final LoginStatus status;
  final SystemStatus systemStatus;
  final GlobalKey<FormState>? formKey;
  final String user;
  final String password;
  final bool isPasswordVisible;

  LoginState copyWith({
    LoginStatus? status,
    SystemStatus? systemStatus,
    GlobalKey<FormState>? formKey,
    String? user,
    String? password,
    bool? isPasswordVisible,
  }) {
    return LoginState(
      status: status ?? this.status,
      systemStatus: systemStatus ?? this.systemStatus,
      formKey: formKey ?? this.formKey,
      user: user ?? this.user,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }

  @override
  List<Object?> get props => [
        status,
        systemStatus,
        formKey,
        user,
        password,
        isPasswordVisible,
      ];
}
