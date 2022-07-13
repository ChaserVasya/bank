import 'package:flutter/material.dart';

class SeparatedColumn extends StatelessWidget {
  const SeparatedColumn({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    required this.separatorBuilder,
  }) : super(key: key);

  final int itemCount;
  final Widget Function(int index) itemBuilder;
  final Widget Function(int index) separatorBuilder;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = [];
    for (var index = 0; index < itemCount * 2 - 1; index++) {
      final itemIndex = index ~/ 2;
      late final Widget widget;
      if (index.isEven) {
        widget = itemBuilder(itemIndex);
      } else {
        widget = separatorBuilder(itemIndex);
      }
      widgets.add(widget);
    }
    return Column(children: widgets);
  }
}
