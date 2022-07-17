import 'package:bank/application/helper/last_date_range.dart';
import 'package:bank/presentation/view/template/overlay_menu/overlay_menu.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:bank/application/helper/text/date_time_range_format.dart';
import 'package:bank/presentation/view_model/history.dart';

class RangeMenu extends StatelessWidget {
  RangeMenu({Key? key}) : super(key: key);

  final formatter = DateFormat.yMd();

  @override
  Widget build(BuildContext context) {
    final shortcuts = DateRangeShortcut.values.toList();
    final settings = context.watch<HistoryViewModel>();

    shortcuts.removeWhere((e) => e == settings.shortcut);

    return OverlayMenu(
      label: (settings.shortcut == null) //
          ? settings.range.format(formatter)
          : settings.shortcut!.name,
      length: shortcuts.length,
      onItemPressed: (i) => settings.shortcutRange = shortcuts[i],
      itemContentBuilder: (_, i) => Text(shortcuts[i].name),
    );
  }
}
