part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class AppSubscriptionRequested extends AppEvent {}

class AppLogOutRequested extends AppEvent {}

class AppLogOutExpiredToken extends AppEvent {}

class AppUserChanged extends AppEvent {
  const AppUserChanged(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}
