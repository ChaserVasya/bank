import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'application/app.dart';
import 'application/error/error_handler.dart';
import 'application/observer.dart';

//TODO Feature. Add icon switching for different platforms
void main() {
  BlocOverrides.runZoned(
    () {
      FutureBuilder.debugRethrowError = true;
      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
      FlutterError.onError = ErrorHandler.onFlutterError;
      runApp(const App());
    },
    blocObserver: AppBlocObserver(),
  );
}
