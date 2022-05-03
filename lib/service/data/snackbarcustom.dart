import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text, String product) {
  final snackBar = SnackBar(
    content: Text(text.toString() + product.toString()),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    backgroundColor: Theme.of(context).primaryColor,
  );
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
}
