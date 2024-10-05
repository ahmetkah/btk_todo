import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

part 'auth_data.g.dart';

@JsonSerializable()
class AuthData with EquatableMixin {
  ///
  const AuthData({
    this.userId,
    this.token,
  });

  ///
  factory AuthData.fromJson(Map<String, dynamic> json) =>
      _$AuthDataFromJson(json);

  ///
  final String? userId;
  final String? token;

  ///
  Map<String, dynamic> toJson() => _$AuthDataToJson(this);

  ///
  @override
  List<Object?> get props => [
        userId,
        token,
      ];
}
