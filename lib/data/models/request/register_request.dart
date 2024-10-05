import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest with EquatableMixin {
  ///
  const RegisterRequest({
    required this.username,
    required this.name,
    required this.surname,
    required this.password,
    required this.email,
  });

  ///
  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  ///
  final String? username;
  final String? name;
  final String? surname;
  final String? password;
  final String? email;

  ///
  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);

  ///
  @override
  List<Object?> get props => [
        username,
        name,
        surname,
        password,
        email,
      ];
}
