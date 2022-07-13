import 'package:flutter/material.dart';

class ExpansionNotifier extends ChangeNotifier {
  bool _isExpanded = false;
  bool get isExpanded => _isExpanded;
  set isExpanded(bool newValue) {
    if (_isExpanded == newValue) return;
    _isExpanded = newValue;
    notifyListeners();
  }

  void switchValue() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }
}
