import 'dart:async';

import 'package:app_cuy/app/app.dart';
import 'package:app_cuy/home/home.dart';
import 'package:app_cuy/info/info.dart';
import 'package:app_cuy/login/login.dart';
import 'package:app_cuy/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

GoRouter goRouter(BuildContext context, GoRouterRefreshStream refresh) {
  const unauthenticatedRoutes = <String>{
    '/login',
    '/plans',
  };

  return GoRouter(
    redirect: (context, state) {
      final appBloc = context.read<AppBloc>().state;
      final isAuthenticated = appBloc.status.isAuthenticated;

      if (isAuthenticated) {
        return state.uri.toString() == '/login' ? '/' : null;
      } else {
        if (unauthenticatedRoutes.any(
          (value) {
            if (state.uri.toString() != '/') {
              return state.uri.toString().contains(value);
            }
            return false;
          },
        )) {
          return null;
        } else {
          return '/login';
        }
      }
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (_, __) => const LoginPage(),
      ),
      GoRoute(
        path: '/plans',
        builder: (_, __) => const HomePage(),
      ),
      GoRoute(
        path: '/',
        builder: (_, __) => const HomePage(),
        routes: [
          GoRoute(
            path: 'profile',
            builder: (_, __) => const ProfilePage(),
          ),
          GoRoute(
            path: 'info',
            builder: (_, __) => const InfoPage(),
          ),
        ],
      ),
    ],
    refreshListenable: refresh,
    debugLogDiagnostics: true,
  );
}
