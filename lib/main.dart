import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:bank/application/app.dart';
import 'package:bank/application/error/error_handler.dart';

//TODO Feature. Add icon switching for different platforms
void main() {
  runZonedGuarded(() {
    FutureBuilder.debugRethrowError = true;
    final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    FlutterError.onError = ErrorHandler.onFlutterError;
    runApp(const App());
  }, ErrorHandler.onZoneError);
}
