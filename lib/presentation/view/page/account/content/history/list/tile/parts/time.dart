import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionTime extends StatelessWidget {
  const TransactionTime(this.dateTime, {Key? key}) : super(key: key);

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    final text = DateFormat.Hm().format(dateTime);

    return Text(text);
  }
}
