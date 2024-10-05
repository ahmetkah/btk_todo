enum AppStorage {
  ///
  token('token'),
  isFirstTimeAppOpen('isFirstTimeAppOpen'),
  isLoggedIn('isLoggedIn');

  ///
  const AppStorage(this.key);
  final String key;
}
