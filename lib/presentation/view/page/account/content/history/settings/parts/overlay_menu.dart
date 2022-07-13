import 'package:flutter/material.dart';

class OverlayMenu extends StatefulWidget {
  final String label;
  final Widget menu;

  const OverlayMenu({
    super.key,
    required this.label,
    required this.menu,
  });

  @override
  _OverlayMenuState createState() => _OverlayMenuState();
}

class _OverlayMenuState extends State<OverlayMenu> {
  final LayerLink _layerLink = LayerLink();

  OverlayEntry? _overlayEntry;

  void _switchView() {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context)!.insert(_overlayEntry!);
    } else {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  OverlayEntry _createOverlayEntry() {
    final size = context.findRenderObject()!.paintBounds.size;

    return OverlayEntry(
      builder: (_) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          child: Material(
            child: widget.menu,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextButton(
        onPressed: _switchView,
        child: Row(
          children: [
            Text(widget.label),
            Icon(Icons.arrow_downward),
          ],
        ),
      ),
    );
  }
}
