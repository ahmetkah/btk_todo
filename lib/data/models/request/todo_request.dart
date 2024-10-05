import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo_request.g.dart';

@JsonSerializable()
class TodoRequest with EquatableMixin {
  ///
  const TodoRequest({
    this.title,
    this.completed,
  });

  factory TodoRequest.fromJson(Map<String, dynamic> json) =>
      _$TodoRequestFromJson(json);

  ///
  final String? title;
  final bool? completed;

  ///
  Map<String, dynamic> toJson() => _$TodoRequestToJson(this);

  ///
  @override
  List<Object?> get props => [
        title,
        completed,
      ];
}
