import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'auth/auth.dart';
import 'core/core.dart';
import 'todo/todo.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    ///
    return MultiBlocProvider(
      ///
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => getIt<LoginBloc>(),
        ),
        BlocProvider<SignupBloc>(
          create: (context) => getIt<SignupBloc>(),
        ),
        BlocProvider<TodoCubit>(
          create: (context) => getIt<TodoCubit>()..fetchAllTodos(),
        ),
      ],
      child: MaterialApp.router(
        title: 'BTK Todo',
        debugShowCheckedModeBanner: false,

        /// [Router]
        routerConfig: appRouter,

        /// [Theme]
        theme: AppTheme.lightTheme,

        ///darkTheme: AppTheme.darkTheme,

        /// [L10n]
        /// Delegate: Temsilci Listesi
        localizationsDelegates: AppLocalizations.localizationsDelegates,

        /// Desteklenen Diller
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
