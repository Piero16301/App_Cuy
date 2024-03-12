import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_api/user_api.dart';
import 'package:user_repository/user_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required this.userRepository})
      : super(
          userRepository.currentUser.isEmpty
              ? const AppState.unauthenticated()
              : AppState.authenticated(user: userRepository.currentUser),
        ) {
    on<AppSubscriptionRequested>(_onSubscriptionRequested);
    on<AppUserChanged>(_onUserChanged);
    on<AppLogOutRequested>(_onLogOutRequested);
    on<AppLogOutExpiredToken>(_onExpiredToken);
  }

  late final StreamSubscription<User> _userSubscription;
  final UserRepository userRepository;

  void _onSubscriptionRequested(
    AppSubscriptionRequested event,
    Emitter<AppState> emit,
  ) {
    _userSubscription =
        userRepository.user.listen((User user) => add(AppUserChanged(user)));
  }

  void _onUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    emit(
      event.user.isEmpty
          ? const AppState.unauthenticated()
          : AppState.authenticated(user: event.user),
    );
  }

  Future<void> _onLogOutRequested(
    AppLogOutRequested event,
    Emitter<AppState> emit,
  ) async {
    await userRepository.logout();
  }

  Future<void> _onExpiredToken(
    AppLogOutExpiredToken event,
    Emitter<AppState> emit,
  ) async {
    return userRepository.logout();
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
