import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._userRepository) : super(const ProfileState());

  final UserRepository _userRepository;

  Future<void> logout() async {
    emit(state.copyWith(status: ProfileStatus.loading));
    try {
      await _userRepository.logout();
      emit(state.copyWith(status: ProfileStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ProfileStatus.failure));
    }
  }
}
