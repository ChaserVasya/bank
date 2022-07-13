import 'package:flutter/material.dart';
import 'package:money2/money2.dart';
import 'package:provider/provider.dart';
import 'package:test_frezux/presentation/view_model/history.dart';

class CurrencyMenu extends StatelessWidget {
  const CurrencyMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currencies = Currencies().getRegistered().toList();
    final settings = context.read<HistoryViewModel>();

    return Column(
      children: List.generate(
        currencies.length,
        (i) => TextButton(
          onPressed: () => settings.currency = currencies[i],
          child: Text(currencies[i].name),
        ),
      ),
    );
  }
}
