// Flutter imports:
import 'package:flutter/material.dart';

Future<void> showCustomFormDialog({
  required BuildContext context,
  required TextEditingController titleController,
  required String dialogTitle,
  required String labelText,
  required String cancelButtonText,
  required String submitButtonText,
  required Future<void> Function() onSubmitButtonPressed,
}) async {
  final formKey = GlobalKey<FormState>();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(dialogTitle),
        content: Form(
          key: formKey,
          child: TextFormField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: labelText,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '入力してください';
              }
              return null;
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(cancelButtonText),
          ),
          TextButton(
            onPressed: () async {
              if (!formKey.currentState!.validate()) return;

              await onSubmitButtonPressed();

              if (context.mounted) Navigator.of(context).pop();
            },
            child: Text(submitButtonText),
          ),
        ],
      );
    },
  );
}
