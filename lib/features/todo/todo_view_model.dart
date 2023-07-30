import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/model/todo.dart';
import 'todo_state.dart';

class TodoViewModel extends StateNotifier<TodoState> {
  TodoViewModel() : super(const TodoState(todos: []));

  void add(Todo todo) {
    state = state.copyWith(
      todos: [...state.todos, todo],
    );
  }

  void toggle(String id) {
    state = state.copyWith(
      todos: [
        for (final todo in state.todos)
          if (todo.id == id)
            Todo(id: todo.id, title: todo.title, completed: !todo.completed)
          else
            todo
      ],
    );
  }
}

final todoListProvider = StateNotifierProvider<TodoViewModel, TodoState>((ref) {
  return TodoViewModel();
});
