import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

/// Global tanımlanan [Service Locator] instance'ı
final GetIt getIt = GetIt.instance;

///
@InjectableInit()

///
Future<void> configureDependencies() async => getIt.init();
