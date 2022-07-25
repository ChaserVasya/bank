import 'package:bank/application/helper/day_separator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bank/presentation/view/widget/separated_column.dart';
import 'package:bank/presentation/view_model/history.dart';

import 'day_separator_tile.dart';
import 'tile/tile.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transactions = context.watch<HistoryViewModel>().transactions;
    final times = transactions.map((e) => e.dateTime).toList();
    final needSeparate = DaySeparator.needSeparate(times);

    return SeparatedColumn(
      startWithSeparator: true,
      itemCount: transactions.length,
      itemBuilder: (i) => HistoryTile(transactions[i]),
      separatorBuilder: (i) {
        return DaySeparatorTile(
          needSeparate: needSeparate[i],
          dateTime: transactions[i].dateTime,
        );
      },
    );
  }
}
