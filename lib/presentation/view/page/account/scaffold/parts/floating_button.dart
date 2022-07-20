import 'package:bank/presentation/view_model/expansion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPageFloatingButton extends StatelessWidget {
  const AccountPageFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(1, 0.8),
      child: BlocBuilder<ExpansionCubit, bool>(
        builder: (_, isExpanded) => FloatingActionButton.extended(
          onPressed: context.read<ExpansionCubit>().switchValue,
          label: Text(isExpanded ? "Hide" : "Show"),
        ),
      ),
    );
  }
}
