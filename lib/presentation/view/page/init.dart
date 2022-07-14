import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:bank/application/injection.dart';
import 'package:bank/presentation/view/plug/page.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  void initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {
    await inject();
    await _pushHome();
  }

  Future<void> _pushHome() async {
    await Future(() => Navigator.pushReplacementNamed(context, "/account"));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return const PagePlug();
  }
}
