import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_frezux/presentation/view/page/account/content/history/list/tile/day_separator_builder.dart';
import 'package:test_frezux/presentation/view/page/account/content/history/list/tile/tile.dart';
import 'package:test_frezux/presentation/view_model/history.dart';

class HistoryList extends StatelessWidget {
  HistoryList({Key? key}) : super(key: key);

  final _separator = DaySeparatorBuilder();

  @override
  Widget build(BuildContext context) {
    final transactions = context.watch<HistoryViewModel>().transactions;

    return ListView.separated(
      itemBuilder: (_, i) => HistoryTile(transactions[i]),
      separatorBuilder: (_, i) => _separator.build(context, transactions[i].dateTime),
      itemCount: transactions.length,
    );
  }
}
