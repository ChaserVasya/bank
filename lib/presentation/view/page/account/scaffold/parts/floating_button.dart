import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bank/presentation/view_model/expansion.dart';

class AccountPageFloatingButton extends StatelessWidget {
  const AccountPageFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final expansionNotifier = context.watch<ExpansionNotifier>();
    return Align(
      alignment: const Alignment(1, 0),
      child: FloatingActionButton.extended(
        onPressed: expansionNotifier.switchValue,
        label: Text(expansionNotifier.isExpanded ? "Hide" : "Show"),
      ),
    );
  }
}
