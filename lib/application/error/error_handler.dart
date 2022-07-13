import 'package:flutter/material.dart';

class ErrorHandler {
  static void onFlutterError(FlutterErrorDetails details) {
    FlutterError.presentError(details);
  }

  static Future<void> onZoneError(Object e, [StackTrace? s]) async {
    // Exception handling logic. Something like:
    //
    // final alert = switchExceptionAlert(e);
    // showExceptionDialog(alert);
  }

  static Widget errorWidgetBuilder(FlutterErrorDetails details) {
    return const Center(
      child: Text("Oops! Render error!"),
    );
  }
}
