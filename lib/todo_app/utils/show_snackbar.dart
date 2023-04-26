// Flutter imports:
import 'package:flutter/material.dart';

void showSnackbar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 1500),
      behavior: SnackBarBehavior.floating,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      content: Row(
        children: [
          const Icon(
            Icons.info_outline,
            color: Color(0xFF72A2FF),
          ),
          const SizedBox(width: 8),
          Text(message),
        ],
      ),
    ),
  );
}
