import 'package:flutter/material.dart';

void customSnackBar(context, String? text, bool isError) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: isError ? Colors.red : Colors.blue,
      content: Text(text ?? ''),
    ),
  );
}
