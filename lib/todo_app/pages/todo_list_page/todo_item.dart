// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:murasame_playground/todo_app/model/model.dart';
import 'package:murasame_playground/todo_app/providers/providers.dart';
import 'package:murasame_playground/todo_app/utils/utils.dart';

class TodoItem extends ConsumerWidget {
  const TodoItem({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: Text(todo.title),
        ),
        Checkbox(
          value: todo.isCompleted,
          side: const BorderSide(color: Color(0xFFFF7939)),
          onChanged: (value) async {
            await ref
                .read(asyncTodoListProvider.notifier)
                .toggleIsCompleted(id: todo.id);

            if (context.mounted) {
              showSnackbar(
                context: context,
                message: todo.isCompleted ? '未完了にしました' : '完了にしました',
              );
            }
          },
        ),
        // 編集ボタン
        IconButton(
          icon: const Icon(
            Icons.edit,
            color: Color(0xFF72A2FF),
          ),
          onPressed: () async {
            final titleController = TextEditingController(text: todo.title);
            await showCustomFormDialog(
              context: context,
              titleController: titleController,
              dialogTitle: 'Todoの編集',
              labelText: 'タイトル',
              cancelButtonText: 'キャンセル',
              submitButtonText: '更新',
              onSubmitButtonPressed: () => ref
                  .read(asyncTodoListProvider.notifier)
                  .editTodoTitle(title: titleController.text, id: todo.id)
                  .then(
                      (_) => showSnackbar(context: context, message: '更新しました')),
            );
          },
        ),
        // 削除ボタン
        IconButton(
          icon: const Icon(
            Icons.delete,
            color: Color(0xFFFF7A72),
          ),
          onPressed: () async {
            await ref
                .read(asyncTodoListProvider.notifier)
                .deleteTodoList(id: todo.id);

            if (context.mounted) {
              showSnackbar(context: context, message: '削除しました');
            }
          },
        ),
      ],
    );
  }
}
