import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeRangeFormat on DateTimeRange {
  String format(DateFormat formatter) {
    final startText = formatter.format(start);
    final endText = formatter.format(end);

    return "$startText - $endText";
  }
}
