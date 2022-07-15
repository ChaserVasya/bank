import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeRangeUtils on DateTimeRange {
  String format(DateFormat formatter) {
    final startText = formatter.format(start);
    final endText = formatter.format(end);

    return "$startText - $endText";
  }

  bool includes(DateTime dateTime) {
    return (start.isBefore(dateTime) && end.isAfter(dateTime)) ||
        start.isAtSameMomentAs(dateTime) ||
        end.isAtSameMomentAs(dateTime);
  }
}
