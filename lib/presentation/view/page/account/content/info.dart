import 'package:bank/presentation/view/widget/awaiter.dart';
import 'package:bank/presentation/view/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bank/presentation/view/animation/expansion.dart';
import 'package:bank/presentation/view_model/user.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Awaiter(
      create: (_) => UserViewModel(),
      builder: (context) {
        final viewModel = context.watch<UserViewModel>();
        final money = viewModel.user.account.money;
        return Theme(
          data: darkTheme,
          child: ColoredBox(
            color: Theme.of(context).colorScheme.primary,
            child: DefaultTextStyle(
              style: darkTextStyle,
              child: Builder(
                builder: (context) {
                  return Expansion(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            foregroundImage: ExactAssetImage(viewModel.currencyImagePath),
                          ),
                          Text(
                            "${money.currency.code} Account",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: Colors.white70),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                money.format("S 0.00"),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ].map((e) => _ChildrenSplitting(child: e)).toList(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ChildrenSplitting extends StatelessWidget {
  const _ChildrenSplitting({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: child,
    );
  }
}
