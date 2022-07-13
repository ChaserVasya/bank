import 'package:flutter/material.dart';
import 'package:test_frezux/application/dto/user_transaction.dart';
import 'package:test_frezux/application/helper/text/transaction_direction.dart';

class TransactionAmountText extends StatelessWidget {
  const TransactionAmountText(this.transaction, {Key? key}) : super(key: key);

  final UserTransaction transaction;

  @override
  Widget build(BuildContext context) {
    final sign = transaction.direction.toSign();
    final amount = transaction.amount.format("S 0.00 CCC");

    return Text("$sign $amount");
  }
}
