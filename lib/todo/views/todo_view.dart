import 'package:flutter/material.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const _TodoViewBody(),
    );
  }
}

class _TodoViewBody extends StatelessWidget {
  const _TodoViewBody();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Todo View'),
    );
  }
}
