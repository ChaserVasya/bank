import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

typedef DateTimeSeparatorBuilder = DateTime Function(BuildContext, DateTime);

class DaySeparatorBuilder {
  final _formatter = DateFormat("E, MMMd");

  final _previous = DateTime.now();

  Widget build(BuildContext context, DateTime dateTime) {
    dateTime = dateTime.toLocal();

    if (_isAnotherDay(dateTime))
      return _buildDaySeparator(dateTime);
    else
      return _buildEmptySeparator();
  }

  bool _isAnotherDay(DateTime dateTime) {
    return dateTime.day != _previous.day;
  }

  Widget _buildDaySeparator(DateTime dateTime) {
    return Container(
      height: 20,
      color: Colors.grey,
      child: Text(_formatter.format(dateTime)),
    );
  }

  Widget _buildEmptySeparator() {
    return Divider(height: 0);
  }
}
