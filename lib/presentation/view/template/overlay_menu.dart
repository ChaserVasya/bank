import 'package:bank/presentation/view/theme.dart';
import 'package:flutter/material.dart';

//TODO Feature. Add expansion animation.
class OverlayMenu extends StatefulWidget {
  final String label;
  final int length;
  final IndexedWidgetBuilder itemContentBuilder;
  final void Function(int) onItemPressed;

  //! Menu column is persistant but I request builders for future transition to [ListView]
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

class _OverlayMenuState extends State<OverlayMenu> with MaterialStateMixin {
  final _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  Size? _size;
  late OutlinedButton _button;

  void _setOverlay() {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context)!.insert(_overlayEntry!);
    }
  }

  void _removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  OverlayEntry _createOverlayEntry() {
    final options = List.generate(
      widget.length,
      (i) => OutlinedButton(
        onPressed: () {
          widget.onItemPressed(i);
          _removeOverlay();
        },
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            style: BorderStyle.none,
          ),
        ),
        child: Row(
          children: [
            widget.itemContentBuilder(context, i),
            const Spacer(),
            if (i == 0) const Icon(Icons.arrow_upward),
          ],
        ),
      ),
      growable: false,
    );

    return OverlayEntry(
      builder: (_) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: _removeOverlay,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: kToolbarHeight),
              child: ClipRect(
                clipBehavior: Clip.hardEdge,
                child: CompositedTransformFollower(
                  link: _layerLink,
                  showWhenUnlinked: false,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      height: _size!.height,
                      width: _size!.width,
                      child: Theme(
                        data: darkTheme,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                            ),
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: const BorderRadius.all(Radius.circular(4)),
                          ),
                          //! Not [ListView] because it has ugly extra paddings
                          //TODO Refactor. Create my own Sliver which doesn`t build unnecessary children
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: options,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: LayoutBuilder(
        builder: (_, constrains) {
          _size = Size(
            constrains.maxWidth,
            MediaQuery.of(context).size.height / 4,
          );

          _button = OutlinedButton(
            onPressed: _setOverlay,
            child: Row(
              children: [
                Text(widget.label),
                const Spacer(),
                const Icon(Icons.arrow_downward),
              ],
            ),
          );
          return _button;
        },
      ),
    );
  }
}
