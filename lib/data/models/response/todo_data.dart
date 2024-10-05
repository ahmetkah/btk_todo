import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo_data.g.dart';

@JsonSerializable()
class TodoData with EquatableMixin {
  ///
  const TodoData({
    this.id,
    this.userId,
    this.title,
    this.completed,
    this.createdAt,
    this.updatedAt,
  });

  ///
  factory TodoData.fromJson(Map<String, dynamic> json) =>
      _$TodoDataFromJson(json);

  ///
  @JsonKey(name: '_id')
  final String? id;
  final String? userId;
  final String? title;
  final bool? completed;
  final String? createdAt;
  final String? updatedAt;

  ///
  Map<String, dynamic> toJson() => _$TodoDataToJson(this);

  ///
  @override
  List<Object?> get props => [
        id,
        userId,
        title,
        completed,
        createdAt,
        updatedAt,
      ];
}
