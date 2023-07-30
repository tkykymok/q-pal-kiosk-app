import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:q_pal_kiosk_app/domain/model/todo.dart';
import 'package:q_pal_kiosk_app/features/todo/todo_view_model.dart';

class TodoView extends HookConsumerWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(todoListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: state.todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(state.todos[index].title),
            subtitle: Text(state.todos[index].completed.toString()),
            leading: Checkbox(
              value: state.todos[index].completed,
              onChanged: (value) {
                ref
                    .read(todoListProvider.notifier)
                    .toggle(state.todos[index].id);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final todo = Todo(id: DateTime.now().toString(), title: 'New Todo');
          ref.read(todoListProvider.notifier).add(todo);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
