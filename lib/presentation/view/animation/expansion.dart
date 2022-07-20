import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bank/presentation/view_model/expansion.dart';

class Expansion extends StatefulWidget {
  const Expansion({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  State<Expansion> createState() => _ExpansionState();
}

class _ExpansionState extends State<Expansion> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  static final _easeInTween = CurveTween(curve: Curves.easeInOut);
  static const _duration = Duration(milliseconds: 400);

  late Animation<double> _heightFactor;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _duration, vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
  }

  @override
  void didChangeDependencies() {
    final viewModel = context.watch<ExpansionCubit>();

    if (viewModel.state)
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
    bool closed = false;

    return BlocConsumer<ExpansionCubit, bool>(
      listener: (_, isExpanded) => closed = !isExpanded && _controller.isDismissed,
      builder: (_, isExpanded) => AnimatedOpacity(
        duration: _duration,
        opacity: isExpanded ? 1 : 0,
        child: AnimatedBuilder(
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
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
