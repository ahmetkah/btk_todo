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
    this.listTodo = const <TodoData>[],
    this.todoData = const TodoData(),
  });

  ///
  final TodoStatus status;
  final List<TodoData> listTodo;
  final TodoData todoData;

  ///
  TodoState copyWith({
    TodoStatus? status,
    List<TodoData>? listTodo,
    TodoData? todoData,
  }) {
    return TodoState(
      status: status ?? this.status,
      listTodo: listTodo ?? this.listTodo,
      todoData: todoData ?? this.todoData,
    );
  }

  @override
  List<Object> get props => [
        status,
        listTodo,
        todoData,
      ];
}
