import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'content.dart';
import 'view_model.dart';

class OverlayPage extends StatefulWidget {
  const OverlayPage({
    Key? key,
    required this.size,
    required this.layerLink,
  }) : super(key: key);

  final Size size;
  final LayerLink layerLink;

  @override
  State<OverlayPage> createState() => _OverlayPageState();
}

class _OverlayPageState extends State<OverlayPage> {
  static const _curve = Curves.easeOut;
  static const _duration = Duration(milliseconds: 200);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // To set opacity to 1 only one time AFTER [AnimatedOpacity] initing.
    // [AnimatedOpacity] should be inited with 0 and then move to 1.
    // Otherwise opacue animation will be ignored;
    //! There is a [Provider<OverlayViewModel>] above the Overlay! Be careful!
    Future(() => context.read<OverlayViewModel>().opacity = 1);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OverlayViewModel>(
      builder: (_, viewModel, child) => AnimatedOpacity(
        opacity: viewModel.opacity,
        duration: _duration,
        curve: _curve,
        onEnd: viewModel.onAnimatedOpacityEnd,
        child: child,
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: context.read<OverlayViewModel>().removeOverlay,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: kToolbarHeight),
            child: ClipRect(
              clipBehavior: Clip.hardEdge,
              child: CompositedTransformFollower(
                link: widget.layerLink,
                showWhenUnlinked: false,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.loose(widget.size),
                    child: Theme(
                      data: context.read<OverlayViewModel>().data, //[read] because It is final
                      child: OverlayPageContent(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
