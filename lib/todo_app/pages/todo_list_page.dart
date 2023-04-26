// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:murasame_playground/todo_app/providers/providers.dart';
import 'package:murasame_playground/todo_app/utils/utils.dart';
import 'todo_list_page/todo_item.dart';

class TodoListPage extends HookConsumerWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(asyncTodoListProvider).asData?.value ?? [];
    final uncompletedTodos = todos.where((todo) => !todo.isCompleted).toList();
    final completedTodos = todos.where((todo) => todo.isCompleted).toList();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todoリスト'),
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFFFF7939),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            tabs: [
              Tab(text: '未完了'),
              Tab(text: '完了済み'),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: ListView.builder(
                        itemCount: uncompletedTodos.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TodoItem(todo: uncompletedTodos[index]),
                            ),
                          );
                        })),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: ListView.builder(
                        itemCount: completedTodos.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TodoItem(todo: completedTodos[index]),
                            ),
                          );
                        })),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            foregroundColor: Colors.white,
            onPressed: () async {
              final titleController = TextEditingController();
              await showCustomFormDialog(
                context: context,
                titleController: titleController,
                dialogTitle: 'Todoの作成',
                labelText: 'タイトル',
                cancelButtonText: 'キャンセル',
                submitButtonText: '作成',
                onSubmitButtonPressed: () => ref
                    .read(asyncTodoListProvider.notifier)
                    .addTodo(title: titleController.text)
                    .then((value) =>
                        showSnackbar(context: context, message: 'Todoを作成しました')),
              );
            },
            child: const Icon(Icons.add)),
      ),
    );
  }
}
