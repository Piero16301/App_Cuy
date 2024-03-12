import 'package:user_api/src/models/models.dart';

/// {@template user_api}
/// User API Package
/// {@endtemplate}
abstract class IUserApi {
  /// {@macro user_api}
  const IUserApi();

  /// Provides a Stream of the User
  Stream<User> getUser();

  /// Get the current User
  User get currentUser;

  /// Saves User
  Future<void> saveUser(User user);

  /// Deletes User
  Future<void> deleteUser();

  /// Get system Token
  String getSystemToken();

  /// Saves system Token
  Future<void> saveSystemToken(String token);

  /// Deletes system Token
  Future<void> deleteSystemToken();

  /// Get user Token
  String getUserToken();

  /// Saves user Token
  Future<void> saveUserToken(String token);

  /// Deletes user Token
  Future<void> deleteUserToken();

  /// System authentication
  Future<void> systemAuthenticate();

  /// Login User
  Future<User> login(String username, String password);

  /// Get plans
  Future<List<List<Plan>>> getPlans({
    required String sort,
    required bool isActive,
  });
}
