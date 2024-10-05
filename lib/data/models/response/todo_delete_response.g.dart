// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoDeleteResponse _$TodoDeleteResponseFromJson(Map<String, dynamic> json) =>
    TodoDeleteResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : TodoData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TodoDeleteResponseToJson(TodoDeleteResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
