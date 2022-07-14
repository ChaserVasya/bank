import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bank/presentation/view_model/history.dart';

class CustomRangeButton extends StatelessWidget {
  const CustomRangeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.edit_calendar),
      onPressed: () async {
        final settings = context.read<HistoryViewModel>();
        final allowedRange = LastDateRange.max;

        final range = await showDateRangePicker(
          context: context,
          firstDate: allowedRange.start,
          lastDate: allowedRange.end,
        );

        if (range == null) return;

        settings.range = range;
      },
    );
  }
}
