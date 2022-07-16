// ignore_for_file: invalid_override_of_non_virtual_member, hash_and_equals

import 'package:flutter/widgets.dart';

import '../../../mock/widget.dart';

class MockItem extends MockWidget {
  const MockItem({Key? key}) : super(key: key);

  @override
  bool operator ==(Object other) {
    if (other is MockItem) return true;
    return false;
  }
}

class MockDivider extends MockWidget {
  const MockDivider({Key? key}) : super(key: key);

  @override
  bool operator ==(Object other) {
    if (other is MockDivider) return true;
    return false;
  }
}
