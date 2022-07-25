import 'package:bank/presentation/view/widget/overlay_menu/overlay_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bank/presentation/view_model/history.dart';

class CurrencyMenu extends StatelessWidget {
  const CurrencyMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<HistoryViewModel>();
    final currencies = settings.currencies;

    currencies.removeWhere((e) => e == settings.currentCurrency);

    return OverlayMenu(
      label: settings.currentCurrency.name,
      length: currencies.length,
      onItemPressed: (i) => settings.currentCurrency = currencies[i],
      itemContentBuilder: (_, i) => Text(currencies[i].name),
    );
  }
}
