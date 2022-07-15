import 'package:bank/presentation/view/theme.dart';
import 'package:flutter/material.dart';
import 'package:bank/presentation/view/page/account/content/history/settings/parts/custom_range_button.dart';
import 'package:bank/presentation/view/page/account/content/history/settings/parts/menu/currency.dart';
import 'package:bank/presentation/view/page/account/content/history/settings/parts/menu/range.dart';

class HistorySettings extends StatelessWidget {
  const HistorySettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: darkTheme,
      child: Builder(builder: (context) {
        return ColoredBox(
          color: Theme.of(context).colorScheme.secondary,
          child: DefaultTextStyle(
            style: darkTextStyle,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Transaction history"),
                  ),
                  const CurrencyMenu(),
                  Row(children: [
                    Expanded(child: RangeMenu()),
                    const SizedBox(width: 16),
                    const CustomRangeButton(),
                  ]),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
