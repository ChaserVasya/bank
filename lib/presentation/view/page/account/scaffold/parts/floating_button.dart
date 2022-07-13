import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_frezux/presentation/view_model/expansion.dart';

class AccountPageFloatingButton extends StatelessWidget {
  const AccountPageFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final expansionNotifier = context.watch<ExpansionNotifier>();
    return FloatingActionButton(
      onPressed: expansionNotifier.switchValue,
      child: Text(expansionNotifier.isExpanded ? "hide" : "show"),
    );
  }
}
