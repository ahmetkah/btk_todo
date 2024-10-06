import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

import '/core/core.dart';
import '/data/data.dart';
import '/domain/domain.dart';

part 'signup_event.dart';
part 'signup_state.dart';

@Injectable()
class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc({
    required this.authRepository,
  }) : super(const SignupState()) {
    ///
    on<SignupUsernameChanged>(_onUsernameChanged);

    ///
    on<SignupNameChanged>(_onNameChanged);

    ///
    on<SignupSurnameChanged>(_onSurnameChanged);

    ///
    on<SignupPasswordChanged>(_onPasswordChanged);

    ///
    on<SignupSubmitted>(_onSubmitted);
  }

  final IAuthRepository authRepository;

  /// [1 Username] alanı doldurulduğunda kontrol
  FutureOr<void> _onUsernameChanged(
    SignupUsernameChanged event,
    Emitter<SignupState> emit,
  ) {
    ///
    final username = UsernameInput.dirty(event.username);

    emit(
      state.copyWith(
        username: username,
        status: SignupStatus.edit,
        isValid: Formz.validate([
          username,
          state.name,
          state.username,
          state.password,
        ]),
      ),
    );
  }

  /// [2 Name] alanı doldurulduğunda kontrol
  FutureOr<void> _onNameChanged(
    SignupNameChanged event,
    Emitter<SignupState> emit,
  ) {
    ///
    final name = NameInput.dirty(event.name);

    emit(
      state.copyWith(
        name: name,
        status: SignupStatus.edit,
        isValid: Formz.validate([
          state.username,
          name,
          state.username,
          state.password,
        ]),
      ),
    );
  }

  /// [3 Surname] alanı doldurulduğunda kontrol
  FutureOr<void> _onSurnameChanged(
    SignupSurnameChanged event,
    Emitter<SignupState> emit,
  ) {
    ///
    final surname = NameInput.dirty(event.surname);

    emit(
      state.copyWith(
        surname: surname,
        status: SignupStatus.edit,
        isValid: Formz.validate([
          state.username,
          state.name,
          surname,
          state.password,
        ]),
      ),
    );
  }

  /// [4 Password] alanı doldurulduğunda kontrol
  FutureOr<void> _onPasswordChanged(
    SignupPasswordChanged event,
    Emitter<SignupState> emit,
  ) {
    ///
    final password = PasswordInput.dirty(event.password);

    emit(
      state.copyWith(
        password: password,
        status: SignupStatus.edit,
        isValid: Formz.validate([password, state.username]),
      ),
    );
  }

  FutureOr<void> _onSubmitted(
    SignupSubmitted event,
    Emitter<SignupState> emit,
  ) async {
    ///
    if (!state.isValid) return;
    emit(state.copyWith(status: SignupStatus.loading));

    /// Request'i hazırlayalım
    final request = RegisterRequest(
      username: state.username.value,
      name: state.name.value,
      surname: state.surname.value,
      password: state.password.value,
      email: state.username.value,
    );

    /// Metodu çağır
    final result = await authRepository.registerUser(request: request);

    ///
    result.fold(
      /// [Handle left]: Error Type
      (AuthFailure failure) => emit(
        state.copyWith(
          status: SignupStatus.failure,
        ),
      ),

      /// [Handle right]: Response Type
      (response) {
        return emit(
          state.copyWith(
            status: SignupStatus.authenticated,
          ),
        );
      },
    );
  }
}
