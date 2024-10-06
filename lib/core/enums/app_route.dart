/// [Enum] yapısı: Runtime Constant
/// Kullanımı: AppRoutName.home.path
enum AppRouteName {
  /// Top-Level Rotalar
  landing('/landing'),
  login('/login'),
  signup('/signup'),
  todo('/todo');

  const AppRouteName(this.path);
  final String path;

  /// goNamed ve pushNamed kullanırken
  /// '/' işaretini kaldırmak için bir getter ekliyoruz.
  /// Kullanımı: AppRoutName.home.withoutSlash
  String get withoutSlash => path.replaceFirst('/', '');

  /// Sub-Route'lar için sonuna '/' işareti koyman için.
  String get withTrailingSlash => '$path/';
}
