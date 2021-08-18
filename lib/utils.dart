import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(BuildContext context, String message) =>
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
            padding: const EdgeInsets.all(10),
            backgroundColor: Colors.blueAccent[200],
            content: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )));
}
