part of 'Register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

final class RegisterUsernameChanged extends RegisterEvent {
  const RegisterUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

final class RegisterNameChanged extends RegisterEvent {
  const RegisterNameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

final class RegisterSurnameChanged extends RegisterEvent {
  const RegisterSurnameChanged(this.surname);

  final String surname;

  @override
  List<Object> get props => [surname];
}

final class RegisterPasswordChanged extends RegisterEvent {
  const RegisterPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class RegisterSubmitted extends RegisterEvent {
  const RegisterSubmitted(
    this.username,
    this.name,
    this.surname,
    this.password,
  );

  final String username;
  final String name;
  final String surname;
  final String password;

  @override
  List<Object> get props => [
        username,
        name,
        surname,
        password,
      ];
}
