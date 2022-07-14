import 'package:flutter/material.dart';
import 'package:bank/application/dto/user_transaction.dart';

import 'parts/amount.dart';
import 'parts/image.dart';
import 'parts/time.dart';

class HistoryTile extends StatelessWidget {
  const HistoryTile(
    this.userTransaction, {
    Key? key,
  }) : super(key: key);

  final UserTransaction userTransaction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TransactionTileImage(userTransaction.imagePath),
      title: Text(userTransaction.anotherParticipantName),
      subtitle: TransactionTime(userTransaction.dateTime),
      trailing: TransactionAmountText(userTransaction),
    );
  }
}
