import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'todo_data.dart';

part 'todo_list_response.g.dart';

@JsonSerializable()
class TodoListResponse with EquatableMixin {
  ///
  const TodoListResponse({
    this.success,
    this.message,
    this.data,
  });

  ///
  factory TodoListResponse.fromJson(Map<String, dynamic> json) =>
      _$TodoListResponseFromJson(json);

  ///
  final bool? success;
  final String? message;
  final List<TodoData>? data;

  ///
  Map<String, dynamic> toJson() => _$TodoListResponseToJson(this);

  ///
  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}
