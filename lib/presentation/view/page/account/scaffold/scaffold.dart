import 'package:flutter/material.dart';

import 'parts/appbar.dart';
import 'parts/floating_button.dart';

class AccountPageScaffold extends StatelessWidget {
  const AccountPageScaffold({required this.body, Key? key}) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AccountPageAppBar(),
        floatingActionButton: const AccountPageFloatingButton(),
        body: ClipRect(
          child: body,
        ),
      ),
    );
  }
}
