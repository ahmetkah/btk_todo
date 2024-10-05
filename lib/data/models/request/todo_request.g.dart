// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoRequest _$TodoRequestFromJson(Map<String, dynamic> json) => TodoRequest(
      title: json['title'] as String?,
      completed: json['completed'] as bool?,
    );

Map<String, dynamic> _$TodoRequestToJson(TodoRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'completed': instance.completed,
    };
