// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import '../model/todo.dart';

// Todoリストのサンプルデータ
const List<Todo> _sampleTodos = [
  Todo(id: 1, title: 'Todoリストの作成', isCompleted: false),
  Todo(id: 2, title: 'Todoリストのデザイン', isCompleted: false),
  Todo(id: 3, title: 'Todoリストのテスト', isCompleted: false),
  Todo(id: 4, title: 'Todoリストのリリース', isCompleted: false),
];

const _key = 'todos';

class LocalStorage {
  static FutureOr<List<Todo>> getTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_key);

    if (json == null) {
      return _sampleTodos;
    }

    final todos = jsonDecode(json) as List;
    return todos.map((todo) => Todo.fromJson(todo)).toList();
  }

  static Future<void> setTodos(List<Todo> todos) async {
    final prefs = await SharedPreferences.getInstance();
    final json = jsonEncode(todos.map((todo) => todo.toJson()).toList());
    await prefs.setString(_key, json);
  }
}
