import 'package:bank/presentation/view/widget/separated_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mock/widget.dart';
import '../mock/const_elements.dart';

Future<List<MockWidget>> separate(
  WidgetTester tester,
  List<Widget> items, {
  bool startWithSeparator = false,
}) async {
  await tester.pumpWidget(
    SeparatedColumn(
      itemCount: items.length,
      itemBuilder: (i) => items[i],
      separatorBuilder: (i) => const MockDivider(),
      startWithSeparator: startWithSeparator,
    ),
  );

  return tester.widgetList<MockWidget>(find.bySubtype<MockWidget>()).toList();
}
