part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == HomeStatus.initial;
  bool get isLoading => this == HomeStatus.loading;
  bool get isSuccess => this == HomeStatus.success;
  bool get isFailure => this == HomeStatus.failure;
}

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.plans = const <List<Plan>>[],
  });

  final HomeStatus status;
  final List<List<Plan>> plans;

  HomeState copyWith({
    HomeStatus? status,
    List<List<Plan>>? plans,
  }) {
    return HomeState(
      status: status ?? this.status,
      plans: plans ?? this.plans,
    );
  }

  @override
  List<Object> get props => [
        status,
        plans,
      ];
}
