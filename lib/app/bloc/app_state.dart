part of 'app_bloc.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated;

  bool get isAuthenticated => this == AuthStatus.authenticated;
}

class AppState extends Equatable {
  const AppState._({required this.status, this.user = User.empty});
  const AppState.authenticated({required User user})
      : this._(status: AuthStatus.authenticated, user: user);
  const AppState.unauthenticated() : this._(status: AuthStatus.unauthenticated);
  const AppState.unknown() : this._(status: AuthStatus.unknown);

  final AuthStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}
