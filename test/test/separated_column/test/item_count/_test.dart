import 'package:flutter_test/flutter_test.dart';

import '../../../../mock/widget.dart';
import '../../helper/separate.dart';
import '../../mock/const_elements.dart';

void main() {
  group("[SeparatorColumn]. Correct widgets count.", () {
    testWidgets('0 widgets when 0 items', (tester) async {
      final result = await separate(tester, _items0);
      expect(result, _expected0);
    });
    testWidgets('0 separators when 1 item', (tester) async {
      final result = await separate(tester, _items1);
      expect(result, _expected1);
    });
    testWidgets('1 separator when 2 items', (tester) async {
      final result = await separate(tester, _items2);
      expect(result, _expected2);
    });
  });
}

const _items0 = <MockWidget>[];
const _expected0 = <MockWidget>[];

const _items1 = [
  MockItem(),
];
const _expected1 = [
  MockItem(),
];

const _items2 = [
  MockItem(),
  MockItem(),
];
const _expected2 = [
  MockItem(),
  MockDivider(),
  MockItem(),
];
