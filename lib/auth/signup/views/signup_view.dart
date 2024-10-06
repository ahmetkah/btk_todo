import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:go_router/go_router.dart';

import '/auth/auth.dart';
import '/core/core.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    ///
    return GestureDetector(
      /// Dismiss the Keyboard - Klavyeyi Kapat/Gizle
      onTap: () {
        final currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },

      ///
      child: const Scaffold(
        ///
        body: _SignupViewBody(),
      ),
    );
  }
}

class _SignupViewBody extends StatelessWidget {
  const _SignupViewBody();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      children: const [
        /// [1] Logo
        BtkAkademiLogo(),
        SizedBox(height: 20),

        /// [2]
        _SignupWelcomeMessage(),
        SizedBox(height: 20),

        /// [3] Username Field
        _UsernameField(),

        /// [4] Name Field
        _NameField(),

        /// [5] Surname Field
        _SurnameField(),

        /// [6] Password Field
        _PasswordField(),

        /// [7] Login Button
        _SignupButton(),
        SizedBox(height: 15),

        /// [8]
        _HaveAnAccountAlready(),
      ],
    );
  }
}

class _SignupWelcomeMessage extends StatelessWidget {
  const _SignupWelcomeMessage();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.translate.authRegisterAccount,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        Text(
          context.translate.authJoinAppToday(context.translate.appName),
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _UsernameField extends StatelessWidget {
  const _UsernameField();

  @override
  Widget build(BuildContext context) {
    final read = context.read<SignupBloc>();
    final state = context.watch<SignupBloc>().state;

    return AppTextField(
      hintText: context.translate.authFormUsername,
      autoFillHints: const [AutofillHints.username],
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      prefix: const Icon(
        Icons.email_outlined,
      ),

      /// [Event Tetikle]
      onChanged: (username) => read.add(
        SignupUsernameChanged(username),
      ),

      errorText: state.username.displayError
          ?.errorText(context, context.translate.authFormUsername),
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField();

  @override
  Widget build(BuildContext context) {
    final read = context.read<SignupBloc>();
    final state = context.watch<SignupBloc>().state;

    return AppTextField(
      hintText: context.translate.authFormName,
      autoFillHints: const [AutofillHints.name],
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      prefix: const Icon(
        Icons.person,
      ),

      /// [Event Tetikle]
      onChanged: (name) => read.add(
        SignupNameChanged(name),
      ),

      errorText: state.name.displayError
          ?.errorText(context, context.translate.authFormName),
    );
  }
}

class _SurnameField extends StatelessWidget {
  const _SurnameField();

  @override
  Widget build(BuildContext context) {
    final read = context.read<SignupBloc>();
    final state = context.watch<SignupBloc>().state;

    return AppTextField(
      hintText: context.translate.authFormSurname,
      autoFillHints: const [AutofillHints.familyName],
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      prefix: const Icon(
        Icons.person_outline,
      ),

      /// [Event Tetikle]
      onChanged: (surname) => read.add(
        SignupSurnameChanged(surname),
      ),

      errorText: state.surname.displayError
          ?.errorText(context, context.translate.authFormName),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    final read = context.read<SignupBloc>();
    final state = context.watch<SignupBloc>().state;

    return AppTextField(
      hintText: context.translate.authFormPassword,
      autoFillHints: const [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      obscureText: true,
      // obscureText parametresi sebebiyle min/maxLine'a elle değer
      minLines: 1,
      maxLines: 1,
      prefix: const Icon(
        Icons.lock,
      ),

      /// [Event Tetikle]
      onChanged: (password) => read.add(
        SignupPasswordChanged(password),
      ),

      errorText: state.password.displayError
          ?.errorText(context, context.translate.authFormPassword),
    );
  }
}

class _SignupButton extends StatelessWidget {
  const _SignupButton();

  @override
  Widget build(BuildContext context) {
    final read = context.read<SignupBloc>();
    final state = context.watch<SignupBloc>().state;

    ///
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        /// Giriş Hatalı ise
        if (state.status == SignupStatus.failure) {
          final errorText = Text(
            context.translate.signupMessageError,
            style: const TextStyle(
              color: Colors.white,
            ),
          );

          final snackBar = SnackBar(
            content: errorText,
            backgroundColor: Theme.of(context).colorScheme.error,
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }

        ///
        if (state.status == SignupStatus.authenticated) {
          final successText = Text(
            context.translate.signupMessageSuccess(state.username.value),
            style: const TextStyle(
              color: Colors.white,
            ),
          );
          final snackBar = SnackBar(
            content: successText,
            backgroundColor: Theme.of(context).colorScheme.primary,
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);

          /// [Dashboard Sayfasına Git]
          /// _goDashboardView(context);
        }
      },

      ///
      child: AppElevatedButton(
        ///
        onPressed: state.isValid
            ? () {
                /// Dismiss the Keyboard - Klavyeyi Kapat/Gizle
                FocusScope.of(context).unfocus();

                /// Kullanıcı Giriş İşlemi
                read.add(
                  SignupSubmitted(
                    state.username.value,
                    state.name.value,
                    state.surname.value,
                    state.password.value,
                  ),
                );
              }

            /// isValid değilse Disable olarak göster
            : null,

        ///
        child: state.status == SignupStatus.loading ||
                state.status == SignupStatus.authenticated
            ? CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onPrimary,
              )
            : Text(
                context.translate.authButtonSignUp,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                ),
              ),
      ),
    );
  }

  // [28. Adım]
  //void _goDashboardView(BuildContext context) => context.go('/dashboard');
}

class _HaveAnAccountAlready extends StatelessWidget {
  const _HaveAnAccountAlready();

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      onPressed: () {},

      /// [Login Sayfasına Git]
      ///  [28. Adım]
      /// onPressed: () => _goLoginView(context),

      primaryText: context.translate.authAlreadyAccount,
      actionText: context.translate.authButtonLogIn,
    );
  }
  // [28. Adım]
  // void _goLoginView(BuildContext context) => context.go('/login');
}
