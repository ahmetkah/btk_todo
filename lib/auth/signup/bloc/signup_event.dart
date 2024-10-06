part of 'signup_bloc.dart';

sealed class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

final class SignupUsernameChanged extends SignupEvent {
  const SignupUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

final class SignupNameChanged extends SignupEvent {
  const SignupNameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

final class SignupSurnameChanged extends SignupEvent {
  const SignupSurnameChanged(this.surname);

  final String surname;

  @override
  List<Object> get props => [surname];
}

final class SignupPasswordChanged extends SignupEvent {
  const SignupPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class SignupSubmitted extends SignupEvent {
  const SignupSubmitted(
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
