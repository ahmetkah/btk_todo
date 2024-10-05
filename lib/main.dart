import 'package:flutter/material.dart';

import 'app.dart';
import 'core/core.dart';

void main() async {
  /// Initialize [Service Locator]
  await configureDependencies();

  ///
  runApp(
    ///
    const App(),
  );
}
