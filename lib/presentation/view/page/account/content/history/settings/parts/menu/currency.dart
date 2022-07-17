import 'package:bank/presentation/view/template/overlay_menu/overlay_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bank/presentation/view_model/history.dart';

class CurrencyMenu extends StatelessWidget {
  const CurrencyMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<HistoryViewModel>();
    final currencies = settings.currencies;

    currencies.removeWhere((e) => e == settings.currency);

    return OverlayMenu(
      label: settings.currency.name,
      length: currencies.length,
      onItemPressed: (i) => settings.currency = currencies[i],
      itemContentBuilder: (_, i) => Text(currencies[i].name),
    );
  }
}
