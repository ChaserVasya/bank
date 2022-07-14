import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bank/presentation/view_model/expansion.dart';

import 'content/history/history.dart';
import 'content/info.dart';
import 'scaffold/scaffold.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ExpansionNotifier(),
      child: AccountPageScaffold(
        body: ListView(
          children: [
            AccountInfo(),
            History(),
            // ElementPlug(),
          ],
        ),
      ),
    );
  }
}
