import 'package:app_cuy/app/app.dart';
import 'package:app_cuy/app/routes/routes.dart';
import 'package:app_cuy/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late final GoRouter _router;
  late final GoRouterRefreshStream _refreshListenable;

  @override
  void initState() {
    super.initState();
    final authBloc = context.read<AppBloc>();
    _refreshListenable = GoRouterRefreshStream(authBloc.stream);
    _router = goRouter(context, _refreshListenable);
  }

  @override
  void dispose() {
    _refreshListenable.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.select<LanguageCubit, Locale>(
      (cubit) => cubit.state.language,
    );

    return MaterialApp.router(
      title: 'App Cuy',
      routeInformationProvider: _router.routeInformationProvider,
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        primaryColor: Colors.blue,
        textTheme: ThemeData.dark().textTheme.apply(
              fontFamily: 'Ubuntu-Regular',
            ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
    );
  }
}
