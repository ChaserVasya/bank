import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bank/presentation/view/page/account/content/history/list/tile/day_separator_builder.dart';
import 'package:bank/presentation/view/page/account/content/history/list/tile/tile.dart';
import 'package:bank/presentation/view/template/separated_column.dart';
import 'package:bank/presentation/view_model/history.dart';

class HistoryList extends StatelessWidget {
  HistoryList({Key? key}) : super(key: key);

  final _separator = DaySeparatorBuilder();

  @override
  Widget build(BuildContext context) {
    final transactions = context.watch<HistoryViewModel>().transactions;

    return SeparatedColumn(
      itemCount: transactions.length,
      itemBuilder: (i) => HistoryTile(transactions[i]),
      separatorBuilder: (i) =>
          _separator.build(context, transactions[i].dateTime),
    );
  }
}
