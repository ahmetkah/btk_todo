import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '/auth/auth.dart';
import '/core/core.dart';
import '/data/data.dart';
import '/todo/todo.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// [AppBar]
      appBar: AppBar(
        title: const Text(
          'Todo View',
        ),
        actions: const [
          ///
          _LogoutButton(),
        ],
      ),

      /// [Drawer]
      drawer: const Drawer(),

      /// [Body]
      body: const _TodoViewBody(),
    );
  }
}

class _TodoViewBody extends StatelessWidget {
  const _TodoViewBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        /// Switch expressions
        return switch (state.status) {
          ///
          TodoStatus.initial => const _NoTodosMessage(),
          TodoStatus.empty => const _NoTodosMessage(),

          ///
          TodoStatus.loading => const _LoadingWidget(text: 'Loading'),

          ///
          TodoStatus.success => _SuccessTodos(
              todos: state.listTodo,
            ),

          ///
          TodoStatus.failure => const _ApiErrorWidget(errorMessage: 'Error')
        };
      },
    );
  }
}

class _SuccessTodos extends StatelessWidget {
  const _SuccessTodos({required this.todos});
  final List<TodoData> todos;

  @override
  Widget build(BuildContext context) {
    ///
    final read = context.read<TodoCubit>();

    return ListView.builder(
      itemCount: todos.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        ///
        return Card(
          elevation: 4,
          child: ListTile(
            /// Başta
            leading: todos[index].completed!
                ? const Icon(Icons.check_box)
                : const Icon(Icons.check_box_outline_blank),

            /// Ortada
            title: Text(
              'Title: ${todos[index].title}',
            ),

            /// Sonda
            trailing: IconButton(
              onPressed: () {
                final id = todos[index].id!;
                read.removeTodo(id: id);
              },
              icon: const Icon(
                Icons.delete,
              ),
            ),
          ),
        );
      },
      padding: const EdgeInsets.all(
        10,
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton();

  @override
  Widget build(BuildContext context) {
    ///
    return BlocListener<LoginBloc, LoginState>(
      ///
      listener: _onStateChangedListener,

      ///
      child: IconButton(
        icon: const Icon(
          Icons.logout_outlined,
        ),

        /// [Event Tetikle]
        onPressed: () => context.read<LoginBloc>().add(LogoutRequested()),
      ),
    );
  }

  void _onStateChangedListener(BuildContext context, LoginState state) {
    ///
    if (state.status == LoginStatus.unAuthenticated) {
      final successText = Text(
        context.translate.logoutMessageSuccess,
        style: const TextStyle(
          color: Colors.white,
        ),
      );
      final snackBar = SnackBar(
        content: successText,
        backgroundColor: Theme.of(context).colorScheme.primary,
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);

      /// [Login Sayfasına Git]
      _goLoginView(context);
    }
  }

  void _goLoginView(BuildContext context) =>
      context.go(AppRouteName.login.path);
}

class _NoTodosMessage extends StatelessWidget {
  const _NoTodosMessage();

  @override
  Widget build(BuildContext context) {
    ///
    return Center(
      ///
      child: Text(
        context.translate.noTodosMessage,
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(
            height: 15,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class _ApiErrorWidget extends StatelessWidget {
  const _ApiErrorWidget({
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.red,
          fontSize: 18,
        ),
      ),
    );
  }
}
