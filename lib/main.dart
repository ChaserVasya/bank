import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:test_frezux/application/app.dart';
import 'package:test_frezux/application/error/error_handler.dart';

//TODO Feature. Add icon switching for different platforms
void main() {
  runZonedGuarded(() {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    FlutterError.onError = ErrorHandler.onFlutterError;
    runApp(const App());
  }, ErrorHandler.onZoneError);
}
