import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest with EquatableMixin {
  ///
  const LoginRequest({
    required this.username,
    required this.password,
  });

  ///
  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  ///
  final String? username;
  final String? password;

  ///
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

  ///
  @override
  List<Object?> get props => [
        username,
        password,
      ];
}
