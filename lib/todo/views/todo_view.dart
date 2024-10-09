import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '/auth/auth.dart';
import '/core/core.dart';
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
          TodoStatus.initial => const NoTodosMessage(),
          TodoStatus.empty => const NoTodosMessage(),

          ///
          TodoStatus.loading => const LoadingWidget(text: 'Loading'),

          ///
          TodoStatus.success => SuccessTodos(
              todos: state.listTodo,
            ),

          ///
          TodoStatus.failure => const ApiErrorWidget(errorMessage: 'Error')
        };
      },
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
