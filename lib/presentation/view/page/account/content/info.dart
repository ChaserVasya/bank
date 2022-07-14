import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bank/presentation/view/animation/expansion.dart';
import 'package:bank/presentation/view/template/content_fetcher.dart';
import 'package:bank/presentation/view_model/user.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentFetcher(
      create: (_) => UserViewModel(),
      builder: (context) {
        final viewModel = context.watch<UserViewModel>();
        final money = viewModel.user.account.money;

        final code = money.currency.code;
        final symbol = money.currency.symbol;
        final amount = money.amount.format("0.00");

        return Expansion(
          child: Column(
            children: [
              CircleAvatar(
                child: Image.asset(viewModel.currencyImagePath),
              ),
              Text("$code Account"),
              Row(
                children: [
                  Text(symbol, style: Theme.of(context).textTheme.bodySmall),
                  Text(amount),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
