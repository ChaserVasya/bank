import 'package:flutter/material.dart';

import '../overlay_menu.dart';

class OverlayViewModel extends ChangeNotifier {
  OverlayViewModel(OverlayEntry entry, this.data, this.menu) : _entry = entry;

  OverlayEntry? _entry;

  final ThemeData data;
  final OverlayMenu menu;

  double _opacity = 0;
  double get opacity => _opacity;
  set opacity(double opacity) {
    _opacity = opacity;
    notifyListeners();
  }

  void removeOverlay() {
    opacity = 0;
  }

  void onAnimatedOpacityEnd() {
    if (opacity != 0) return;

    _entry!.remove();
    _entry = null;
  }
}
