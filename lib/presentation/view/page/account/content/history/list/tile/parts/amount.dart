import 'package:flutter/material.dart';
import 'package:bank/application/dto/transaction_context.dart';
import 'package:bank/application/helper/text/transaction_direction.dart';

class TransactionAmountText extends StatelessWidget {
  const TransactionAmountText(this.transaction, {Key? key}) : super(key: key);

  final TransactionContext transaction;

  @override
  Widget build(BuildContext context) {
    final sign = transaction.direction.toSign();
    final amount = transaction.amount.format("S 0.00 CCC");

    return Text("$sign $amount");
  }
}
