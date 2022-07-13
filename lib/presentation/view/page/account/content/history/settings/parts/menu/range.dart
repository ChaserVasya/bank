import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:test_frezux/application/helper/text/date_time_range_format.dart';
import 'package:test_frezux/presentation/view_model/history.dart';

import '../overlay_menu.dart';

class RangeMenu extends StatelessWidget {
  RangeMenu({Key? key}) : super(key: key);

  final formatter = DateFormat.yMd();

  @override
  Widget build(BuildContext context) {
    final shortcuts = DateRangeShortcut.values;
    final settings = context.watch<HistoryViewModel>();

    return OverlayMenu(
      label: (settings.shortcut == null)
          ? settings.range.format(formatter)
          : settings.shortcut!.name,
      menu: Column(
        children: List.generate(
          shortcuts.length,
          (i) => TextButton(
            onPressed: () => settings.shortcutRange = shortcuts[i],
            child: Text(shortcuts[i].name),
          ),
        ),
      ),
    );
  }
}
