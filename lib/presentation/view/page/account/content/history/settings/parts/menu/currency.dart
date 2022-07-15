import 'package:bank/presentation/view/template/overlay_menu.dart';
import 'package:flutter/material.dart';
import 'package:money2/money2.dart';
import 'package:provider/provider.dart';
import 'package:bank/presentation/view_model/history.dart';

class CurrencyMenu extends StatelessWidget {
  const CurrencyMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currencies = Currencies().getRegistered().toList();
    final settings = context.watch<HistoryViewModel>();

    return OverlayMenu(
      label: settings.currency.name,
      length: currencies.length,
      onItemPressed: (i) => settings.currency = currencies[i],
      itemContentBuilder: (_, i) => Text(currencies[i].name),
    );
  }
}
