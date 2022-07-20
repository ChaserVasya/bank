import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:bank/presentation/view/plug/element.dart';
import 'package:bank/presentation/view_model/awaiting.dart';

class Awaiter<T extends AwaitingCubit> extends StatelessWidget {
  const Awaiter({
    required this.create,
    required this.builder,
    Key? key,
  }) : super(key: key);

  final Create<T> create;
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, WaitingState>(
      bloc: create(context),
      builder: (context, waiting) {
        switch (waiting) {
          case WaitingState.processing:
            return const ElementPlug();
          case WaitingState.ready:
            return Builder(builder: builder);
        }
      },
    );
  }
}
