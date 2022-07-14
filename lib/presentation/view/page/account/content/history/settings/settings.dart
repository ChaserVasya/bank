import 'package:flutter/material.dart';
import 'package:bank/presentation/view/page/account/content/history/settings/parts/custom_range_button.dart';
import 'package:bank/presentation/view/page/account/content/history/settings/parts/menu/currency.dart';
import 'package:bank/presentation/view/page/account/content/history/settings/parts/menu/range.dart';

class HistorySettings extends StatelessWidget {
  const HistorySettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Column(
        children: [
          Text("Transaction history"),
          CurrencyMenu(),
          Row(children: [
            RangeMenu(),
            CustomRangeButton(),
          ]),
        ],
      ),
    );
  }
}
