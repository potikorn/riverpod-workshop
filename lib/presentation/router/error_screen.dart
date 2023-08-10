// Flutter imports:
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    super.key,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text("Please try again later. $errorMessage"),
    ));
  }
}
