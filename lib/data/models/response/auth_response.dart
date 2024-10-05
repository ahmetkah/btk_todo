import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'auth_data.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse with EquatableMixin {
  ///
  const AuthResponse({
    this.success,
    this.message,
    this.data,
  });

  ///
  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  ///
  final bool? success;
  final String? message;
  final AuthData? data;

  ///
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);

  ///
  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}
