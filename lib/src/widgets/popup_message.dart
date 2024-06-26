import 'package:flutter/material.dart';

void popupMessage(data, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(data),
    action: SnackBarAction(
      label: "Dismiss",
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  ));
}
