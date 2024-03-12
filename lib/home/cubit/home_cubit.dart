import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_api/user_api.dart';
import 'package:user_repository/user_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._userRepository) : super(const HomeState());

  final UserRepository _userRepository;

  Future<void> getPlans() async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final plans = await _userRepository.getPlans(
        sort: 'ASC',
        isActive: true,
      );

      emit(
        state.copyWith(
          status: HomeStatus.success,
          plans: plans,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }
}
