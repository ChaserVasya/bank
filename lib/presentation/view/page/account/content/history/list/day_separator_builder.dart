import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

typedef DateTimeSeparatorBuilder = DateTime Function(DateTime);

class DaySeparatorBuilder {
  final _formatter = DateFormat("E, MMMd");

  var _previous = DateTime.now();

  Widget? build(DateTime dateTime) {
    dateTime = dateTime.toLocal();

    Widget? widget;
    if (_isAnotherDay(dateTime))
      widget = _buildDaySeparator(dateTime);
    else
      widget = _buildEmptySeparator();

    _previous = dateTime;
    return widget;
  }

  bool _isAnotherDay(DateTime dateTime) {
    return dateTime.day != _previous.day;
  }

  Widget? _buildDaySeparator(DateTime dateTime) {
    return Container(
      padding: const EdgeInsets.all(12),
      constraints: const BoxConstraints.tightFor(
        width: double.infinity,
      ),
      color: Colors.grey[400],
      child: Text(_formatter.format(dateTime)),
    );
  }

  Widget _buildEmptySeparator() {
    return const Divider(height: 0);
  }
}
