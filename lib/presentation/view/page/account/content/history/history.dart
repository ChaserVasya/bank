import 'package:flutter/material.dart';
import 'package:test_frezux/presentation/view/template/content_fetcher.dart';
import 'package:test_frezux/presentation/view_model/history.dart';

import 'list/list.dart';
import 'settings/settings.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentFetcher(
      create: (_) => HistoryViewModel(),
      builder: (_) => Column(
        children: [
          HistorySettings(),
          HistoryList(),
        ],
      ),
    );
  }
}
