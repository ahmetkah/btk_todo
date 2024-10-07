import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '/core/core.dart';
import '/data/data.dart';
import '/domain/domain.dart';

abstract class ITodoRepository {
  Future<Either<TodoFailure, TodoListResponse>> getAllTodos();
  Future<Either<TodoFailure, TodoResponse>> getTodoById({
    required int id,
  });
  Future<Either<TodoFailure, TodoResponse>> updateTodo({
    required TodoRequest request,
    required int id,
  });

  Future<Either<TodoFailure, TodoResponse>> insertTodo({
    required TodoRequest request,
  });
  Future<Either<TodoFailure, TodoDeleteResponse>> deleteTodo({
    required String id,
  });
}

@Singleton(as: ITodoRepository)
class TodoRepository implements ITodoRepository {
  ///
  TodoRepository({
    required this.todoClient,
    required this.storageRepository,
  });

  ///
  final TodoClient todoClient;

  ///
  final IStorageRepository storageRepository;

  /// [1 Tüm Todoları Getir]
  @override
  Future<Either<TodoFailure, TodoListResponse>> getAllTodos() async {
    try {
      final response = await todoClient.getAllTodos();

      if (response.success == null || !response.success!) {
        return const Left(
          TodoFailure(
            message: 'Tüm Todoları Getirme Başarısız',
          ),
        );
      }
      return Right(response);

      ///
    } catch (e) {
      return Left(
        TodoFailure(
          message: '$e',
        ),
      );
    }
  }

  /// [2 ID'ye Göre Getir]
  @override
  Future<Either<TodoFailure, TodoResponse>> getTodoById({
    required int id,
  }) async {
    try {
      final response = await todoClient.getTodoById(id);

      if (response.success == null || !response.success!) {
        return const Left(
          TodoFailure(
            message: 'Todo Getirme Başarısız',
          ),
        );
      }
      return Right(response);

      ///
    } catch (e) {
      return Left(
        TodoFailure(
          message: '$e',
        ),
      );
    }
  }

  /// [3 Todoyu Güncelle]
  @override
  Future<Either<TodoFailure, TodoResponse>> updateTodo({
    required TodoRequest request,
    required int id,
  }) async {
    try {
      final response = await todoClient.updateTodo(request, id);

      if (response.success == null || !response.success!) {
        return const Left(
          TodoFailure(
            message: 'Todo Güncelleme Başarısız',
          ),
        );
      }
      return Right(response);

      ///
    } catch (e) {
      return Left(
        TodoFailure(
          message: '$e',
        ),
      );
    }
  }

  /// [4 Yeni Todo Ekle]
  @override
  Future<Either<TodoFailure, TodoResponse>> insertTodo({
    required TodoRequest request,
  }) async {
    try {
      final response = await todoClient.insertTodo(request);

      if (response.success == null || !response.success!) {
        return const Left(
          TodoFailure(
            message: 'Todo Ekleme Başarısız',
          ),
        );
      }
      return Right(response);

      ///
    } catch (e) {
      return Left(
        TodoFailure(
          message: '$e',
        ),
      );
    }
  }

  /// [5 Todoyu Sil]
  @override
  Future<Either<TodoFailure, TodoDeleteResponse>> deleteTodo({
    required String id,
  }) async {
    try {
      final response = await todoClient.deleteTodo(id);

      if (response.success == null || !response.success!) {
        return const Left(
          TodoFailure(
            message: 'Todo Silme Başarısız',
          ),
        );
      }
      return Right(response);

      ///
    } catch (e) {
      return Left(
        TodoFailure(
          message: '$e',
        ),
      );
    }
  }
}
