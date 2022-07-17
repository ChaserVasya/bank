import 'package:bank/application/helper/day_separator.dart';
import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("[DaySeparator].", () {
    test("Should correctly separate", () {
      withClock(
        Clock.fixed(DateTime(2022, 7, 16, 22, 21)),
        () {
          final needSeparate = DaySeparator.needSeparate(_times());
          expect(needSeparate, _expected);
        },
      );
    });
  });
}

final _times = () {
  return [
    clock.now(),
    clock.now().subtract(const Duration(minutes: 30)),
    clock.now().subtract(const Duration(hours: 2)),
    clock.now().subtract(const Duration(hours: 10)),
    clock.now().subtract(const Duration(days: 1)),
    clock.now().subtract(const Duration(days: 1, hours: 2)),
    clock.now().subtract(const Duration(days: 2)),
    clock.now().subtract(const Duration(days: 3)),
  ];
};

final _expected = [
  true,
  false,
  false,
  false,
  true,
  false,
  true,
  true,
];
