import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '/data/data.dart';
import '/todo/todo.dart';

class SuccessTodos extends StatelessWidget {
  const SuccessTodos({required this.todos, super.key});
  final List<TodoData> todos;

  @override
  Widget build(BuildContext context) {
    final read = context.read<TodoCubit>();
    final indexNotifier = ValueNotifier<int>(0);

    return SlidableAutoCloseBehavior(
      child: ListView.builder(
        itemCount: todos.length,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10),
        itemBuilder: (BuildContext context, int index) {
          return ValueListenableBuilder<int>(
            valueListenable: indexNotifier,
            builder: (context, value, child) {
              return Slidable(
                key: UniqueKey(),
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        // Tamamlama durumunu değiştir
                        //  final id = todos[index].id!;
                        // final completed = !todos[index].completed!;
                        //read.updateTodo(id: id, completed: completed);
                      },
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      icon: Icons.check,
                      label: 'Tamamla',
                    ),
                  ],
                ),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  dismissible: DismissiblePane(
                    confirmDismiss: () async {
                      final result = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Görevi Sil'),
                          content: Text(
                            '"${todos[index].title}" görevini silmek istediğinize emin misiniz?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text('İptal'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text('Sil'),
                            ),
                          ],
                        ),
                      );
                      return result ?? false;
                    },
                    onDismissed: () {
                      final id = todos[index].id!;
                      read.removeTodo(id: id);
                    },
                    closeOnCancel: true,
                  ),
                  children: [
                    SlidableAction(
                      onPressed: (context) async {
                        ///
                        final confirm = await showDialog<bool>(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Görevi Sil'),
                                content: Text(
                                  '"${todos[index].title}" görevini silmek istediğinize emin misiniz?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: const Text('İptal'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                    child: const Text('Sil'),
                                  ),
                                ],
                              ),
                            ) ??
                            false;

                        ///
                        if (confirm) {
                          final id = todos[index].id!;
                          await read.removeTodo(id: id);
                        }
                      },
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Sil',
                    ),
                  ],
                ),
                child: Card(
                  elevation: 4,
                  child: ListTile(
                    leading: todos[index].completed!
                        ? const Icon(Icons.check_box)
                        : const Icon(Icons.check_box_outline_blank),
                    title: Text('Title: ${todos[index].title}'),
                    trailing: IconButton(
                      onPressed: () {
                        final id = todos[index].id!;
                        read.removeTodo(id: id);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
