// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:murasame_playground/todo_app/data/data.dart';
import 'package:murasame_playground/todo_app/model/model.dart';

part 'todo_state_provider.g.dart';

@riverpod
class AsyncTodoList extends _$AsyncTodoList {
  Future<List<Todo>> _fetchTodo() async {
    return await LocalStorage.getTodos();
  }

  // build()メソッドの戻り値がstateに自動的に設定されるため、stateに代入する必要がない
  @override
  Future<List<Todo>> build() => _fetchTodo();

  Future<void> addTodo({required String title}) async {
    final oldTodos = await LocalStorage.getTodos();
    final newTodos = [
      ...oldTodos,
      Todo(id: oldTodos.last.id + 1, title: title, isCompleted: false)
    ];
    await LocalStorage.setTodos(newTodos);
    _updateState(newTodos);
  }

  Future<void> toggleIsCompleted({required int id}) async {
    final newTodos = state.asData!.value.map((todo) {
      if (todo.id == id) {
        return Todo(
          id: todo.id,
          title: todo.title,
          isCompleted: !todo.isCompleted,
        );
      } else {
        return todo;
      }
    }).toList();

    await LocalStorage.setTodos(newTodos);
    _updateState(newTodos);
  }

  Future<void> editTodoTitle({required int id, required String title}) async {
    final newTodos = state.asData!.value.map((todo) {
      if (todo.id == id) {
        return Todo(
          id: todo.id,
          title: title,
          isCompleted: todo.isCompleted,
        );
      } else {
        return todo;
      }
    }).toList();

    await LocalStorage.setTodos(newTodos);
    _updateState(newTodos);
  }

  Future<void> deleteTodoList({required int id}) async {
    final newTodos =
        state.asData!.value.where((todo) => todo.id != id).toList();

    await LocalStorage.setTodos(newTodos);
    _updateState(newTodos);
  }

  void _updateState(List<Todo> newTodos) {
    state = AsyncValue.data(newTodos);
  }
}
