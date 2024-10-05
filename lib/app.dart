import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'core/core.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BTK Todo',

      home: const Text(''),

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      /// [L10n]
      /// Delegate: Temsilci Listesi
      localizationsDelegates: AppLocalizations.localizationsDelegates,

      /// Desteklenen Diller
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
