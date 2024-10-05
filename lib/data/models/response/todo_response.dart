import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'todo_data.dart';

part 'todo_response.g.dart';

@JsonSerializable()
class TodoResponse with EquatableMixin {
  ///
  const TodoResponse({
    this.success,
    this.message,
    this.data,
  });

  ///
  factory TodoResponse.fromJson(Map<String, dynamic> json) =>
      _$TodoResponseFromJson(json);

  ///

  final bool? success;
  final String? message;
  final TodoData? data;

  Map<String, dynamic> toJson() => _$TodoResponseToJson(this);

  @override
  List<Object?> get props => [success, message, data];
}
