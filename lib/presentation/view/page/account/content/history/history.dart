import 'package:bank/presentation/view/template/awaiter.dart';
import 'package:flutter/material.dart';
import 'package:bank/presentation/view_model/history.dart';

import 'list/list.dart';
import 'settings/settings.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Awaiter(
      create: (_) => HistoryViewModel(),
      builder: (_) => Column(
        children: const [
          HistorySettings(),
          HistoryList(),
        ],
      ),
    );
  }
}
