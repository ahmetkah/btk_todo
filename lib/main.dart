import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'core/core.dart';

void main() async {
  /// Uygulamanın grafiksel arayüz (widget) işlemlerini gerçekleştirmeden
  /// Önce widget sisteminin düzgün bir şekilde başlatılmasını sağlar.
  WidgetsFlutterBinding.ensureInitialized();

  /// [Cihazın Ekran Yönünü Sabitleme]
  await SystemChrome.setPreferredOrientations([
    /// Sadece [Dikey] çalışsın
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  /// Initialize [Service Locator]
  await configureDependencies();

  ///
  runApp(
    ///
    const App(),
  );
}
