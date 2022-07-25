import 'package:flutter/material.dart';

class SeparatedColumn extends StatelessWidget {
  const SeparatedColumn({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    required this.separatorBuilder,
    this.startWithSeparator = false,
  }) : super(key: key);

  final int itemCount;
  final bool startWithSeparator;
  final Widget Function(int index) itemBuilder;
  final Widget? Function(int index) separatorBuilder;

  @override
  Widget build(BuildContext context) {
    final separatorsCount = itemCount + (startWithSeparator ? 0 : -1);
    final totalWidgets = itemCount + separatorsCount;

    Widget? widget;
    final List<Widget> widgets = [];
    for (var i = 0; i < totalWidgets; i++) {
      final itemIndex = i ~/ 2;

      if (startWithSeparator ? i.isOdd : i.isEven)
        widget = itemBuilder(itemIndex);
      else
        widget = separatorBuilder(itemIndex);

      if (widget == null) continue;

      widgets.add(widget);
    }
    return Column(children: widgets);
  }
}
