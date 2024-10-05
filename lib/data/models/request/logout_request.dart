import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logout_request.g.dart';

@JsonSerializable()
class LogoutRequest with EquatableMixin {
  ///
  const LogoutRequest({
    required this.userId,
  });

  ///
  factory LogoutRequest.fromJson(Map<String, dynamic> json) =>
      _$LogoutRequestFromJson(json);

  ///
  final String? userId;

  ///
  Map<String, dynamic> toJson() => _$LogoutRequestToJson(this);

  ///
  @override
  List<Object?> get props => [userId];
}
