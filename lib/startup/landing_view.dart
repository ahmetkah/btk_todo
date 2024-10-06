import 'package:flutter/material.dart';
//import 'package:go_router/go_router.dart';

import '/core/core.dart';
import '/domain/domain.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    ///
    return const Scaffold(
      ///
      body: _LandingViewBody(),
    );
  }
}

class _LandingViewBody extends StatelessWidget {
  const _LandingViewBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: ListView(
        children: const [
          /// [1] Logo
          BtkAkademiLogo(),
          SizedBox(height: 50),

          /// [2]
          _LandingTextMessage(),
          SizedBox(height: 10),

          /// [3] SignUp Button
          _GoSignupViewButton(),
          SizedBox(height: 10),

          /// [3] SignUp Button
          _DividerWithText(),
          SizedBox(height: 10),

          /// [4] Login Button
          _GoLoginViewButton(),
        ],
      ),
    );
  }
}

class _LandingTextMessage extends StatelessWidget {
  const _LandingTextMessage();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.translate.landingGreeting,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        Text(
          context.translate.landingMessage,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _GoSignupViewButton extends StatelessWidget {
  const _GoSignupViewButton();

  @override
  Widget build(BuildContext context) {
    ///
    return AppElevatedButton(
      ///
      onPressed: () {
        //[28. Adımda]
        //_goSignupView(context);
        debugPrint('');

        /// Uygulamanın ilk açılış durumunu depolar.
        _storeFirstAppOpenStatus();
      },

      ///
      child: Text(
        context.translate.authCreateAccount,
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
        ),
      ),
    );
  }

  // [28. Adımda] void _goSignupView(BuildContext context) => context.go('/signup');

  Future<void> _storeFirstAppOpenStatus() async {
    /// Uygulama cihazda ilk defa açıldığı için isFirstTimeAppOpen'ı [false] yap
    /// Böylece kullanıcı her açılışta bu sayfayı tekrar görmesin
    await getIt<IStorageRepository>()
        .setIsFirstTimeAppOpen(isFirstTimeAppOpen: false);
  }
}

class _DividerWithText extends StatelessWidget {
  const _DividerWithText();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: Theme.of(context).colorScheme.primary,
            indent: 20,
            endIndent: 10,
          ),
        ),
        Text(
          context.translate.dividerOrText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Theme.of(context).colorScheme.primary,
            indent: 10,
            endIndent: 20,
          ),
        ),
      ],
    );
  }
}

class _GoLoginViewButton extends StatelessWidget {
  const _GoLoginViewButton();

  @override
  Widget build(BuildContext context) {
    ///
    return AppElevatedButton(
      ///
      isSecondary: true,

      ///
      onPressed: () {
        // [28. Adımda]
        // _goLoginView(context);
        debugPrint('');

        /// Uygulamanın ilk açılış durumunu depolar.
        _storeFirstAppOpenStatus();
      },

      ///
      child: Text(
        context.translate.authButtonLogIn,
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
        ),
      ),
    );
  }

  //  // [28. Adımda]
  //void _goLoginView(BuildContext context) => context.go('/login');

  Future<void> _storeFirstAppOpenStatus() async {
    /// Uygulama cihazda ilk defa açıldığı için isFirstTimeAppOpen'ı [false] yap
    /// Böylece kullanıcı her açılışta bu sayfayı tekrar görmesin
    await getIt<IStorageRepository>()
        .setIsFirstTimeAppOpen(isFirstTimeAppOpen: false);
  }
}
