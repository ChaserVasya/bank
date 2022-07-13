import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:test_frezux/application/injection.dart';
import 'package:test_frezux/presentation/view/plug/page.dart';

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
    await Future(() => Navigator.pushReplacementNamed(context, "/tasks"));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return const PagePlug();
  }
}
