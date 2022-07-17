import 'package:flutter_test/flutter_test.dart';

import '../../helper/separate.dart';
import '../../mock/const_elements.dart';

void main() {
  group("[SeparatorColumn].", () {
    testWidgets(
      'Shouldn`t start without separator when not [startWithSeparator]',
      (tester) async {
        final result = await separate(tester, items, startWithSeparator: false);
        expect(result, expectedWithoutStartSeparator);
      },
    );
    testWidgets('Should start without separator when [startWithSeparator]', (tester) async {
      final result = await separate(tester, items, startWithSeparator: true);
      expect(result, expectedWithStartSeparator);
    });
  });
}

const items = [
  MockItem(),
  MockItem(),
];

const expectedWithoutStartSeparator = [
  MockItem(),
  MockDivider(),
  MockItem(),
];

const expectedWithStartSeparator = [
  MockDivider(),
  MockItem(),
  MockDivider(),
  MockItem(),
];
