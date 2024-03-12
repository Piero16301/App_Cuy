import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_api/user_api.dart';

/// {@template user_api_remote}
/// User API Remote Package
/// {@endtemplate}
class UserApiRemote implements IUserApi {
  /// {@macro user_api_remote}
  UserApiRemote({
    required Dio httpClient,
    required SharedPreferences preferences,
  })  : _httpClient = httpClient,
        _preferences = preferences {
    init();
  }

  final Dio _httpClient;
  final SharedPreferences _preferences;
  final BehaviorSubject<User> _userStreamController =
      BehaviorSubject<User>.seeded(User.empty);

  /// The key used to store the user in shared preferences
  static const kUserKey = '__user_key__';

  /// The key used to store the system token in shared preferences
  static const kSystemTokenKey = '__system_token_key__';

  /// The key used to store the user token in shared preferences
  static const kUserTokenKey = '__user_token_key__';

  String? _getValue(String key) => _preferences.getString(key);
  Future<void> _setValue(String key, String value) =>
      _preferences.setString(key, value);

  /// Initialize the User API
  void init() {
    // Add JWT interceptor to the HTTP client
    _httpClient.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = getSystemToken();
          if (token.isNotEmpty) {
            options.headers['Authorization'] = 'Cuy-oauthtoken $token';
          }
          return handler.next(options);
        },
        onError: (error, handler) {
          if (error.response?.statusCode == 401) {
            systemAuthenticate();
          }
          return handler.next(error);
        },
      ),
    );

    // Load the user from shared preferences
    final userJson = _getValue(kUserKey);
    if (userJson == null) {
      _userStreamController.add(User.empty);
    } else {
      final userMap = jsonDecode(userJson) as Map<String, dynamic>;
      final user = User.fromJson(userMap);
      _userStreamController.add(user);
    }
  }

  @override
  Stream<User> getUser() => _userStreamController.asBroadcastStream();

  @override
  User get currentUser {
    final userJson = _getValue(kUserKey);
    if (userJson == null) {
      return User.empty;
    } else {
      final userMap = jsonDecode(userJson) as Map<String, dynamic>;
      final user = User.fromJson(userMap);
      return user;
    }
  }

  @override
  Future<void> saveUser(User user) async {
    _userStreamController.add(user);
    return _setValue(kUserKey, jsonEncode(user));
  }

  @override
  Future<void> deleteUser() async {
    _userStreamController.add(User.empty);
    return _setValue(kUserKey, jsonEncode(User.empty));
  }

  @override
  String getSystemToken() => _getValue(kSystemTokenKey) ?? '';

  @override
  Future<void> saveSystemToken(String token) =>
      _setValue(kSystemTokenKey, token);

  @override
  Future<void> deleteSystemToken() => _preferences.remove(kSystemTokenKey);

  @override
  String getUserToken() => _getValue(kUserTokenKey) ?? '';

  @override
  Future<void> saveUserToken(String token) => _setValue(kUserTokenKey, token);

  @override
  Future<void> deleteUserToken() => _preferences.remove(kUserTokenKey);

  @override
  Future<void> systemAuthenticate() async {
    final response = await _httpClient.post<Map<String, dynamic>>(
      '/api/v1/auth',
      data: {
        'email': dotenv.get('SYSTEM_EMAIL'),
        'password': dotenv.get('SYSTEM_PASSWORD'),
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Error authenticating');
    }

    final token = response.data?['oauthToken'] as String;
    await saveSystemToken(token);
  }

  @override
  Future<User> login(String username, String password) async {
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        '/api/v1/user/login',
        data: {
          'emailOrPhone': username,
          'password': password,
        },
      );

      if (response.statusCode != 200) {
        throw Exception('Error logging in');
      }

      final userJson = response.data?['data'] as Map<String, dynamic>;
      final user = User.fromJson(userJson);

      final token = response.data?['oauthToken'] as String;
      await saveUserToken(token);

      return user;
    } catch (e) {
      throw Exception('Error logging in');
    }
  }

  @override
  Future<List<List<Plan>>> getPlans({
    required String sort,
    required bool isActive,
  }) async {
    final response = await _httpClient.get<Map<String, dynamic>>(
      '/api/v1/service-package',
      queryParameters: {
        'sort': sort,
        'isActive': isActive,
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Error getting plans');
    }

    final listJson = response.data?['list'] as List<dynamic>;
    final list = listJson
        .map((json) => Plan.fromJson(json as Map<String, dynamic>))
        .toList();

    final appListFreeJson = response.data?['appListFree'] as List<dynamic>;
    final appListFree = appListFreeJson
        .map((json) => Plan.fromJson(json as Map<String, dynamic>))
        .toList();

    return [list, appListFree];
  }
}
