import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'todo_data.dart';

part 'todo_delete_response.g.dart';

@JsonSerializable()
class TodoDeleteResponse with EquatableMixin {
  ///
  const TodoDeleteResponse({
    this.success,
    this.message,
    this.data,
  });

  ///
  factory TodoDeleteResponse.fromJson(Map<String, dynamic> json) =>
      _$TodoDeleteResponseFromJson(json);

  ///
  final bool? success;
  final String? message;
  final TodoData? data;

  ///
  Map<String, dynamic> toJson() => _$TodoDeleteResponseToJson(this);

  ///
  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}
