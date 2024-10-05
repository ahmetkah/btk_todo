import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension L10nX on BuildContext {
  /// Uygulamanın dil dosyalarındaki metinlere
  /// BuildContext üzerinden erişmek için
  AppLocalizations get translate => AppLocalizations.of(this)!;
  // Kullanımı: context.translate.keyDegeri,

  /// [localeName]: Uygulamanın diline extension üzerinden erişmek için
  String get localeName => translate.localeName;
  // Kullanımı: context.localeName,
}
