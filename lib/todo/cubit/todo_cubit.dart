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
                  todoListResponse: response,
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
            todoResponse: response,
          ),
        );
      },
    );
  }

  /// insertTodo
  Future<void> removeTodo({required int id}) async {
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
        return emit(
          state.copyWith(
            status: TodoStatus.success,
            todoDeleteResponse: response,
          ),
        );
      },
    );
  }
}
