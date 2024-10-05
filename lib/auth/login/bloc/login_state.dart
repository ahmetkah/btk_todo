part of 'login_bloc.dart';

enum LoginStatus {
  unknown, // Başlangıç durumu, oturum durumu bilinmiyor.
  authenticated, // Kullanıcı başarıyla doğrulanmış.
  unAuthenticated, // Kullanıcı doğrulanamamış.
  loading, // Oturum durumu yükleniyor.
  failure, // Oturum açma işlemi başarısız oldu.
  edit, // Kullanıcı bilgileri düzenleniyor.
}

final class LoginState extends Equatable {
  ///
  const LoginState({
    this.username = const UsernameInput.pure(),
    this.password = const PasswordInput.pure(),
    this.isValid = false,
    this.status = LoginStatus.unknown,
  });

  /// Form Alanlarının
  final UsernameInput username;
  final PasswordInput password;

  ///
  final bool isValid;

  ///
  final LoginStatus status;

  ///
  LoginState copyWith({
    UsernameInput? username,
    PasswordInput? password,
    bool? isValid,
    LoginStatus? status,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        username,
        password,
        isValid,
        status,
      ];
}
