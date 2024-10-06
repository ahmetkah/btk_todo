import 'package:envied/envied.dart';

part 'env_conf.g.dart';

@Envied(path: '.env')
abstract class EnvConf {
  ///
  @EnviedField(varName: 'BASE_URL', defaultValue: '', obfuscate: true)
  static String baseUrl = _EnvConf.baseUrl;
}
