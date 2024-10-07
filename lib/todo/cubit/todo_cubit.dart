import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '/core/core.dart';
import '/data/data.dart';
import '/domain/domain.dart';

part 'todo_state.dart';

@Injectable()
class TodoCubit extends Cubit<TodoState> {
  ///
  TodoCubit({
    required this.todoRepository,
  }) : super(const TodoState());

  ///
  final ITodoRepository todoRepository;

  ///
  Future<void> fetchAllTodos() async {
    /// Yükleme durumunu yayınla
    emit(state.copyWith(status: TodoStatus.loading));

    /// Yapılacakları getir
    final result = await todoRepository.getAllTodos();

    ///
    result.fold(
      /// [Handle left]: Error Type
      (TodoFailure failure) => emit(
        state.copyWith(
          status: TodoStatus.failure,
        ),
      ),

      /// [Handle right]: Response Type
      (response) {
        response.data!.isEmpty
            ? emit(
                state.copyWith(
                  status: TodoStatus.empty,
                ),
              )
            : emit(
                state.copyWith(
                  status: TodoStatus.success,
                  listTodo: response.data,
                ),
              );
      },
    );
  }

  ///
  Future<void> fetchTodoById({required int id}) async {
    /// Yükleme durumunu yayınla
    emit(state.copyWith(status: TodoStatus.loading));

    /// Yapılacakları getir
    final result = await todoRepository.getTodoById(id: id);

    ///
    result.fold(
      /// [Handle left]: Error Type
      (TodoFailure failure) => emit(
        state.copyWith(
          status: TodoStatus.failure,
        ),
      ),

      /// [Handle right]: Response Type
      (response) {
        return emit(
          state.copyWith(
            status: TodoStatus.success,
            todoData: response.data,
          ),
        );
      },
    );
  }

  /// removeTodo
  Future<void> removeTodo({required String id}) async {
    /// Yükleme durumunu yayınla
    emit(state.copyWith(status: TodoStatus.loading));

    /// Yapılacakları getir
    final result = await todoRepository.deleteTodo(id: id);

    ///
    result.fold(

        /// [Handle left]: Error Type
        (TodoFailure failure) => emit(
              state.copyWith(
                status: TodoStatus.failure,
              ),
            ),

        /// [Handle right]: Response Type
        (response) {
      /// state.listTodo içeriğiyle [yeni bir liste oluştur]
      /// ve REST API'den gelen id ile eşleşen öğeyi bu listeden [SİL]
      final updatedList = List.of(state.listTodo)
        ..removeWhere((todo) => todo.id == id);

      return emit(
        state.copyWith(
          status: TodoStatus.success,
          listTodo: updatedList,
        ),
      );
    });
  }
}
