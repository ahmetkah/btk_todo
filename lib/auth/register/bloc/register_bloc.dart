import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

import '/core/core.dart';
import '/data/data.dart';
import '/domain/domain.dart';

part 'register_event.dart';
part 'register_state.dart';

@Injectable()
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({
    required this.authRepository,
  }) : super(const RegisterState()) {
    ///
    on<RegisterUsernameChanged>(_onUsernameChanged);

    ///
    on<RegisterNameChanged>(_onNameChanged);

    ///
    on<RegisterSurnameChanged>(_onSurnameChanged);

    ///
    on<RegisterPasswordChanged>(_onPasswordChanged);

    ///
    on<RegisterSubmitted>(_onSubmitted);
  }

  final IAuthRepository authRepository;

  /// [1 Username] alanı doldurulduğunda kontrol
  FutureOr<void> _onUsernameChanged(
    RegisterUsernameChanged event,
    Emitter<RegisterState> emit,
  ) {
    ///
    final username = UsernameInput.dirty(event.username);

    emit(
      state.copyWith(
        username: username,
        status: RegisterStatus.edit,
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
    RegisterNameChanged event,
    Emitter<RegisterState> emit,
  ) {
    ///
    final name = NameInput.dirty(event.name);

    emit(
      state.copyWith(
        name: name,
        status: RegisterStatus.edit,
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
    RegisterSurnameChanged event,
    Emitter<RegisterState> emit,
  ) {
    ///
    final surname = NameInput.dirty(event.surname);

    emit(
      state.copyWith(
        surname: surname,
        status: RegisterStatus.edit,
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
    RegisterPasswordChanged event,
    Emitter<RegisterState> emit,
  ) {
    ///
    final password = PasswordInput.dirty(event.password);

    emit(
      state.copyWith(
        password: password,
        status: RegisterStatus.edit,
        isValid: Formz.validate([password, state.username]),
      ),
    );
  }

  FutureOr<void> _onSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    ///
    if (!state.isValid) return;
    emit(state.copyWith(status: RegisterStatus.loading));

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
          status: RegisterStatus.failure,
        ),
      ),

      /// [Handle right]: Response Type
      (response) {
        return emit(
          state.copyWith(
            status: RegisterStatus.authenticated,
          ),
        );
      },
    );
  }
}
