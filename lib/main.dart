import 'package:app_cuy/app/app.dart';
import 'package:app_cuy/bootstrap.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_api_remote/user_api_remote.dart';
import 'package:user_repository/user_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: './.env');

  final preferences = await SharedPreferences.getInstance();

  final httpClient = Dio(
    BaseOptions(
      baseUrl: dotenv.get('API_URL'),
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  final userApi = UserApiRemote(
    httpClient: httpClient,
    preferences: preferences,
  );

  final userRepository = UserRepository(userApi: userApi);

  await bootstrap(
    () => AppPage(
      userRepository: userRepository,
    ),
  );
}
