import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DaySeparatorTile extends StatelessWidget {
  DaySeparatorTile({
    required this.needSeparate,
    required this.dateTime,
    Key? key,
  }) : super(key: key);

  final bool needSeparate;
  final DateTime dateTime;

  final _formatter = DateFormat("E, MMM d");

  @override
  Widget build(BuildContext context) {
    if (!needSeparate) return const Divider();

    return Container(
      padding: const EdgeInsets.all(12),
      constraints: const BoxConstraints.tightFor(
        width: double.infinity,
      ),
      color: Colors.grey[400],
      child: Text(_createText()),
    );
  }

  String _createText() {
    switch (clock.now().day - dateTime.day) {
      case 0:
        return "Today";
      case 1:
        return "Yesterday";
      default:
        //When month is different it is fired too
        return _formatter.format(dateTime);
    }
  }
}
