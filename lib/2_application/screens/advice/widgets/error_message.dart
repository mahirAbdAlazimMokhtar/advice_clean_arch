import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;
  const ErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error,
          color: Colors.redAccent,
          size: 40,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          message,
          style: theme.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
