import 'package:flutter/material.dart';
import 'package:bank/presentation/view/plug/element.dart';

class PagePlug extends StatelessWidget {
  const PagePlug({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ElementPlug(),
    );
  }
}
