import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/model/todo.dart';

part 'todo_state.freezed.dart';

@freezed
class TodoState with _$TodoState {
  const factory TodoState({
    required List<Todo> todos,
    @Default(0) int currentIndex,
  }) = _TodoState;
}
