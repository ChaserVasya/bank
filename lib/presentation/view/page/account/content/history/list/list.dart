import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bank/presentation/view/template/separated_column.dart';
import 'package:bank/presentation/view_model/history.dart';

import 'day_separator_builder.dart';
import 'tile/tile.dart';

class HistoryList extends StatelessWidget {
  HistoryList({Key? key}) : super(key: key);

  final _separator = DaySeparatorBuilder();

  @override
  Widget build(BuildContext context) {
    final transactions = context.watch<HistoryViewModel>().transactions;

    return SeparatedColumn(
      startWithSeparator: true,
      itemCount: transactions.length,
      itemBuilder: (i) => HistoryTile(transactions[i]),
      separatorBuilder: (i) => _separator.build(transactions[i].dateTime),
    );
  }
}
