import 'package:flutter/material.dart';
import 'package:test_frezux/application/dto/user_transaction.dart';

import 'parts/amount.dart';
import 'parts/logo.dart';
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
      contentPadding: const EdgeInsets.all(8),
      leading: CompanyLogo(userTransaction.anotherParticipantLogoPath),
      title: Text(userTransaction.anotherParticipantName),
      subtitle: TransactionTime(userTransaction.dateTime),
      trailing: TransactionAmountText(userTransaction),
    );
  }
}
