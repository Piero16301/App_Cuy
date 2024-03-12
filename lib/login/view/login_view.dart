import 'package:app_cuy/app/app.dart';
import 'package:app_cuy/l10n/l10n.dart';
import 'package:app_cuy/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.loginSnackBarError),
              duration: const Duration(seconds: 3),
            ),
          );
          context.read<LoginCubit>().restartStatus();
        }
      },
      builder: (context, state) {
        if (state.systemStatus.isLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state.systemStatus.isFailure) {
          return Scaffold(
            body: Center(
              child: Text(l10n.loginSystemAuthError),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                l10n.loginAppBarTitle,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 22),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: state.formKey,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageLogoLogin(),
                        SizedBox(height: 30),
                        UserFormLogin(),
                        SizedBox(height: 20),
                        PasswordFormLogin(),
                        SizedBox(height: 30),
                        ButtonLogin(),
                        SizedBox(height: 30),
                        ViewPlansButtonLogin(),
                        SizedBox(height: 50),
                        ChangeLanguageLogin(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class ImageLogoLogin extends StatelessWidget {
  const ImageLogoLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 60,
        child: FlutterLogo(
          style: FlutterLogoStyle.horizontal,
          size: double.infinity,
        ),
      ),
    );
  }
}

class UserFormLogin extends StatelessWidget {
  const UserFormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: l10n.loginUserTextField,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        style: Theme.of(context).textTheme.bodyMedium,
        onChanged: context.read<LoginCubit>().userChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return l10n.loginUserError;
          }
          return null;
        },
      ),
    );
  }
}

class PasswordFormLogin extends StatelessWidget {
  const PasswordFormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final isPasswordVisible = context
        .select<LoginCubit, bool>((cubit) => cubit.state.isPasswordVisible);
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: l10n.loginPasswordTextField,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: context.read<LoginCubit>().togglePasswordVisibility,
          ),
        ),
        style: Theme.of(context).textTheme.bodyMedium,
        obscureText: !isPasswordVisible,
        onChanged: context.read<LoginCubit>().passwordChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return l10n.loginPasswordError;
          }
          return null;
        },
      ),
    );
  }
}

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final status =
        context.select<LoginCubit, LoginStatus>((cubit) => cubit.state.status);
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
          onPressed: status.isLoading ? null : context.read<LoginCubit>().login,
          child: status.isLoading
              ? const SizedBox.square(
                  dimension: 30,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Text(
                  l10n.loginButton,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white),
                ),
        ),
      ),
    );
  }
}

class ViewPlansButtonLogin extends StatelessWidget {
  const ViewPlansButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () => context.go('/plans'),
          child: Text(
            context.l10n.loginViewPlansButton,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class ChangeLanguageLogin extends StatelessWidget {
  const ChangeLanguageLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale =
        context.select<LanguageCubit, Locale>((cubit) => cubit.state.language);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DropdownButton<String>(
        borderRadius: BorderRadius.circular(10),
        underline: const SizedBox(),
        value: locale.languageCode == 'es' ? 'es' : 'en',
        items: [
          DropdownMenuItem(
            value: 'en',
            child: Row(
              children: [
                const Icon(Icons.language),
                const SizedBox(width: 10),
                Text(l10n.plansDeviceInfoEnglishItem),
              ],
            ),
          ),
          DropdownMenuItem(
            value: 'es',
            child: Row(
              children: [
                const Icon(Icons.language),
                const SizedBox(width: 10),
                Text(l10n.plansDeviceInfoSpanishItem),
              ],
            ),
          ),
        ],
        onChanged: (value) =>
            context.read<LanguageCubit>().changeLanguage(Locale(value!)),
      ),
    );
  }
}
