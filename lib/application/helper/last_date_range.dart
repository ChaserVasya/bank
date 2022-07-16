import 'package:bank/presentation/view_model/history.dart';
import 'package:clock/clock.dart';
import 'package:flutter/material.dart';

class LastDateRange {
  static const _day = Duration(days: 1);
  static const _week = Duration(days: 7);
  static const _month = Duration(days: 30);
  static const _max = Duration(days: 365 * 200);

  static DateTimeRange getRange(DateRangeShortcut shortcut) {
    final end = clock.now();

    late final DateTime start;
    switch (shortcut) {
      case DateRangeShortcut.day:
        start = end.subtract(_day);
        break;
      case DateRangeShortcut.week:
        start = end.subtract(_week);
        break;
      case DateRangeShortcut.month:
        start = end.subtract(_month);
        break;
      case DateRangeShortcut.all:
        start = end.subtract(_max);
        break;
    }

    return DateTimeRange(start: start, end: end);
  }

  static DateTimeRange get max {
    return getRange(DateRangeShortcut.all);
  }
}
