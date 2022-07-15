import 'package:bank/presentation/view/theme.dart';
import 'package:flutter/material.dart';

import 'error/error_handler.dart';
import 'navigator.dart';
import 'routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bank',
      routes: routes,
      initialRoute: "/init",
      navigatorKey: navigatorKey,
      theme: lightTheme,
      darkTheme: darkTheme,
      builder: (_, widget) {
        ErrorWidget.builder = ErrorHandler.errorWidgetBuilder;
        return widget!;
      },
    );
  }
}
