import 'package:april_29_exam/main.dart';
import 'package:flutter/material.dart';

void showSnackBar({required String message}) {
  snackbarKey.currentState?.showSnackBar(SnackBar(content: Text(message)));
}
