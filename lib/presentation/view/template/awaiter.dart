import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bank/presentation/view/plug/element.dart';
import 'package:bank/presentation/view_model/fetch_notifier.dart';

class Awaiter<T extends AwaitingNotifier> extends StatelessWidget {
  const Awaiter({
    required this.create,
    required this.builder,
    Key? key,
  }) : super(key: key);

  final Create<T> create;
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: create,
      builder: (context, _) {
        return FutureBuilder<void>(
          future: context.read<T>().processing,
          builder: (_, snap) {
            if (snap.connectionState != ConnectionState.done) return const ElementPlug();
            return Builder(builder: builder);
          },
        );
      },
    );
  }
}
