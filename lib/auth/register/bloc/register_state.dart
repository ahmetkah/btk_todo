part of 'register_bloc.dart';

enum RegisterStatus {
  unknown, // Başlangıç durumu, oturum durumu bilinmiyor.
  authenticated, // Kullanıcı başarıyla doğrulanmış.
  unAuthenticated, // Kullanıcı doğrulanamamış.
  loading, // Oturum durumu yükleniyor.
  failure, // Oturum açma işlemi başarısız oldu.
  edit, // Kullanıcı bilgileri düzenleniyor.
}

final class RegisterState extends Equatable {
  ///
  const RegisterState({
    this.username = const UsernameInput.pure(),
    this.name = const NameInput.pure(),
    this.surname = const NameInput.pure(),
    this.password = const PasswordInput.pure(),
    this.isValid = false,
    this.status = RegisterStatus.unknown,
  });

  /// Form Alanlarının
  final UsernameInput username;
  final NameInput name;
  final NameInput surname;
  final PasswordInput password;

  ///
  final bool isValid;

  ///
  final RegisterStatus status;

  ///
  RegisterState copyWith({
    UsernameInput? username,
    NameInput? name,
    NameInput? surname,
    PasswordInput? password,
    bool? isValid,
    RegisterStatus? status,
  }) {
    return RegisterState(
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
