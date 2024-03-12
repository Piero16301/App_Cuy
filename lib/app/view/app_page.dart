import 'dart:io';

import 'package:app_cuy/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

class AppPage extends StatelessWidget {
  const AppPage({
    required UserRepository userRepository,
    super.key,
  }) : _userRepository = userRepository;

  final UserRepository _userRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _userRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AppBloc(userRepository: _userRepository)
              ..add(AppSubscriptionRequested()),
          ),
          BlocProvider(
            create: (_) =>
                LanguageCubit(Locale(Platform.localeName.split('_').first)),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}
