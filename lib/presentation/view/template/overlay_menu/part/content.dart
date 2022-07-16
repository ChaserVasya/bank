import 'package:bank/presentation/view/template/overlay_menu/part/view_model.dart';
import 'package:bank/presentation/view/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OverlayPageContent extends StatelessWidget {
  OverlayPageContent({
    Key? key,
  }) : super(key: key);

  final _buttonStyle = OutlinedButton.styleFrom(
    side: const BorderSide(
      style: BorderStyle.none,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<OverlayViewModel>();

    final outlinedButtonLikeDecoration = BoxDecoration(
      border: Border.all(
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
      ),
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: const BorderRadius.all(Radius.circular(4)),
    );

    return Theme(
      data: darkTheme,
      child: DecoratedBox(
        decoration: outlinedButtonLikeDecoration,
        //! Not [ListView] because it has ugly extra paddings
        //TODO Refactor. Create my own Sliver which doesn`t build unnecessary children
        child: Column(
          children: [
            OutlinedButton(
              onPressed: viewModel.removeOverlay,
              style: _buttonStyle,
              child: Row(
                children: [
                  Text(viewModel.menu.label),
                  const Spacer(),
                  const Icon(Icons.arrow_upward),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: _createOptions(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _createOptions(BuildContext context) {
    final viewModel = context.read<OverlayViewModel>();
    final menu = viewModel.menu;

    return List.generate(
      menu.length,
      (i) => OutlinedButton(
        onPressed: () {
          menu.onItemPressed(i);
          viewModel.removeOverlay();
        },
        style: _buttonStyle,
        child: Row(
          children: [
            menu.itemContentBuilder(context, i),
            const Spacer(),
          ],
        ),
      ),
      growable: false,
    );
  }
}
