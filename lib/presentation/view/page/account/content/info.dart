import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bank/presentation/view/animation/expansion.dart';
import 'package:bank/presentation/view/template/content_fetcher.dart';
import 'package:bank/presentation/view_model/user.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: ContentFetcher(
        create: (_) => UserViewModel(),
        builder: (context) {
          final viewModel = context.watch<UserViewModel>();
          final money = viewModel.user.account.money;

          return Expansion(
            child: Column(
              children: [
                CircleAvatar(
                  foregroundImage: ExactAssetImage(viewModel.currencyImagePath),
                ),
                Text("${money.currency.code} Account"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      money.currency.symbol,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(money.format("S 0.00")),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
