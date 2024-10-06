part of 'todo_cubit.dart';

enum TodoStatus {
  initial,
  empty,
  loading,
  success,
  failure,
}

class TodoState extends Equatable {
  ///
  const TodoState({
    this.status = TodoStatus.initial,
    this.todoListResponse = const TodoListResponse(),
    this.todoResponse = const TodoResponse(),
    this.todoDeleteResponse = const TodoDeleteResponse(),
  });

  ///
  final TodoStatus status;
  final TodoListResponse todoListResponse;
  final TodoResponse todoResponse;
  final TodoDeleteResponse todoDeleteResponse;

  ///
  TodoState copyWith({
    TodoStatus? status,
    TodoListResponse? todoListResponse,
    TodoResponse? todoResponse,
    TodoDeleteResponse? todoDeleteResponse,
  }) {
    return TodoState(
      status: status ?? this.status,
      todoListResponse: todoListResponse ?? this.todoListResponse,
      todoResponse: todoResponse ?? this.todoResponse,
      todoDeleteResponse: todoDeleteResponse ?? this.todoDeleteResponse,
    );
  }

  @override
  List<Object> get props => [
        status,
        todoListResponse,
        todoResponse,
        todoDeleteResponse,
      ];
}
