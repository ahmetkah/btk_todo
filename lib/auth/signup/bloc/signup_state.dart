part of 'signup_bloc.dart';

enum SignupStatus {
  unknown, // Başlangıç durumu, oturum durumu bilinmiyor.
  authenticated, // Kullanıcı başarıyla doğrulanmış.
  unAuthenticated, // Kullanıcı doğrulanamamış.
  loading, // Oturum durumu yükleniyor.
  failure, // Oturum açma işlemi başarısız oldu.
  edit, // Kullanıcı bilgileri düzenleniyor.
}

final class SignupState extends Equatable {
  ///
  const SignupState({
    this.username = const UsernameInput.pure(),
    this.name = const NameInput.pure(),
    this.surname = const NameInput.pure(),
    this.password = const PasswordInput.pure(),
    this.isValid = false,
    this.status = SignupStatus.unknown,
  });

  /// Form Alanlarının
  final UsernameInput username;
  final NameInput name;
  final NameInput surname;
  final PasswordInput password;

  ///
  final bool isValid;

  ///
  final SignupStatus status;

  ///
  SignupState copyWith({
    UsernameInput? username,
    NameInput? name,
    NameInput? surname,
    PasswordInput? password,
    bool? isValid,
    SignupStatus? status,
  }) {
    return SignupState(
      username: username ?? this.username,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        username,
        name,
        surname,
        password,
        isValid,
        status,
      ];
}
