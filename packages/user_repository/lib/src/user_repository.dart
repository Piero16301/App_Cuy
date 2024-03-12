import 'package:user_api/user_api.dart';

/// {@template user_repository}
/// User Repository Package
/// {@endtemplate}
class UserRepository {
  /// {@macro user_repository}
  const UserRepository({
    required IUserApi userApi,
  }) : _userApi = userApi;

  final IUserApi _userApi;

  /// Provides a Stream of the User
  Stream<User> get user => _userApi.getUser();

  /// Get the current User
  User get currentUser => _userApi.currentUser;

  /// Saves User
  Future<void> saveUser(User user) => _userApi.saveUser(user);

  /// Deletes User
  Future<void> deleteUser() => _userApi.deleteUser();

  /// Login System
  Future<void> systemAuthenticate() => _userApi.systemAuthenticate();

  /// Login User
  Future<void> login(String username, String password) async {
    final user = await _userApi.login(username, password);
    await _userApi.saveUser(user);
  }

  /// Logout User
  Future<void> logout() async {
    await _userApi.deleteUser();
    await _userApi.deleteUserToken();
  }

  /// Get plans
  Future<List<List<Plan>>> getPlans({
    required String sort,
    required bool isActive,
  }) =>
      _userApi.getPlans(sort: sort, isActive: isActive);
}
