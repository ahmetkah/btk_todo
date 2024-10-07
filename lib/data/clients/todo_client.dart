import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '/core/core.dart';
import '/data/data.dart';

part 'todo_client.g.dart';

@RestApi()

/// Token İsteyen Servisler
abstract class TodoClient {
  ///
  factory TodoClient(Dio dio, {String baseUrl}) = _TodoClient;

  /// [ USERS'a Ait Olanlar] ////
  @POST(AppUrls.logout)
  Future<AuthResponse> logoutUser(
    @Body() LogoutRequest request,
  );

  /// [ TODOS'a Ait Olanlar] ////
  @GET(AppUrls.todos)
  Future<TodoListResponse> getAllTodos();

  @GET('${AppUrls.todos}/{id}')
  Future<TodoResponse> getTodoById(
    @Path('id') int id,
  );

  @PUT('${AppUrls.todos}/{id}')
  Future<TodoResponse> updateTodo(
    @Body() TodoRequest request,
    @Path('id') int id,
  );

  @DELETE('${AppUrls.todos}/{id}')
  Future<TodoDeleteResponse> deleteTodo(
    @Path('id') String id,
  );

  @POST(AppUrls.todos)
  Future<TodoResponse> insertTodo(
    @Body() TodoRequest request,
  );
}
