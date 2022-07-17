import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'part/page.dart';
import 'part/view_model.dart';

class OverlayMenu extends StatefulWidget {
  final String label;
  final int length;
  final IndexedWidgetBuilder itemContentBuilder;
  final void Function(int) onItemPressed;

  //! Menu column is persistant but I request builders (not iterables)
  //! for future migrating to [ListView]
  const OverlayMenu({
    super.key,
    required this.label,
    required this.itemContentBuilder,
    required this.length,
    required this.onItemPressed,
  });

  @override
  State<OverlayMenu> createState() => _OverlayMenuState();
}

class _OverlayMenuState extends State<OverlayMenu> {
  final _layerLink = LayerLink();
  Size? _size;
  OverlayViewModel? _overlayViewModel;

  void _setOverlay() {
    final overlayEntry = _createOverlayEntry();
    final overlay = Overlay.of(context);

    if (overlay == null) return;

    overlay.insert(overlayEntry);
    _overlayViewModel = OverlayViewModel(overlayEntry, Theme.of(context), widget);
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: LayoutBuilder(
        builder: (_, constrains) {
          _size = Size(constrains.maxWidth, 170);

          return OutlinedButton(
            onPressed: _setOverlay,
            child: Row(
              children: [
                Text(widget.label),
                const Spacer(),
                const Icon(Icons.arrow_downward),
              ],
            ),
          );
        },
      ),
    );
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (_) {
        return ChangeNotifierProvider.value(
          value: _overlayViewModel!,
          child: OverlayPage(
            layerLink: _layerLink,
            size: _size!,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _overlayViewModel?.dispose();
    _overlayViewModel = null;
    super.dispose();
  }
}
