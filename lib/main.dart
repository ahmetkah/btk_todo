import 'package:flutter/material.dart';

import 'app.dart';
import 'core/core.dart';

void main() {
  /// Initialize [Service Locator]
  configureDependencies();

  ///
  runApp(
    ///
    const App(),
  );
}
