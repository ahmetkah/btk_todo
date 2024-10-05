import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  ///
  const Failure({
    required this.message,
    this.statusCode,
  });

  ///
  final String message;
  final String? statusCode;

  @override
  List<Object?> get props => [
        message,
        statusCode,
      ];
}

class AuthFailure extends Failure {
  const AuthFailure({required super.message, super.statusCode});
}

class TodoFailure extends Failure {
  const TodoFailure({required super.message, super.statusCode});
}
