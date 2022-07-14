import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bank/presentation/view_model/expansion.dart';

class Expansion extends StatefulWidget {
  Expansion({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  State<Expansion> createState() => _ExpansionState();
}

class _ExpansionState extends State<Expansion>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  static final _easeInTween = CurveTween(curve: Curves.easeIn);
  static const _expand = Duration(milliseconds: 200);

  late Animation<double> _heightFactor;

  void initState() {
    super.initState();
    _controller = AnimationController(duration: _expand, vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
  }

  @override
  void didChangeDependencies() {
    final viewModel = context.watch<ExpansionNotifier>();

    if (viewModel.isExpanded)
      _controller.forward();
    else
      _controller.reverse().then((value) {
        if (!mounted) return;
        setState(() {
          // Rebuild without widget.children.
        });
      });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final isExpanded = context.watch<ExpansionNotifier>().isExpanded;

    final closed = !isExpanded && _controller.isDismissed;

    return AnimatedBuilder(
      animation: _controller.view,
      builder: (_, child) => Align(
        heightFactor: _heightFactor.value,
        //TODO Check. How useful is Offstage in this case?
        child: Offstage(
          offstage: closed,
          child: TickerMode(
            enabled: !closed,
            child: Container(
              child: child,
            ),
          ),
        ),
      ),
      child: closed ? null : widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
