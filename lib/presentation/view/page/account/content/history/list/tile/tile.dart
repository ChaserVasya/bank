import 'package:flutter/material.dart';
import 'package:bank/application/dto/transaction_context.dart';

import 'parts/amount.dart';
import 'parts/image.dart';
import 'parts/time.dart';

class HistoryTile extends StatelessWidget {
  const HistoryTile(
    this.transactionContext, {
    Key? key,
  }) : super(key: key);

  final TransactionContext transactionContext;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TransactionTileImage(transactionContext.imagePath),
      title: Text(transactionContext.anotherParticipantName),
      subtitle: TransactionTime(transactionContext.dateTime),
      trailing: TransactionAmountText(transactionContext),
    );
  }
}
