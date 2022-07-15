import 'package:bank/presentation/view/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bank/presentation/view/animation/expansion.dart';
import 'package:bank/presentation/view/template/content_fetcher.dart';
import 'package:bank/presentation/view_model/user.dart';

class AccountInfo extends StatelessWidget {
  AccountInfo({Key? key}) : super(key: key);

  final infoLightTheme = darkTheme.copyWith(
    colorScheme: darkTheme.colorScheme.copyWith(
      brightness: Brightness.light,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ContentFetcher(
      create: (_) => UserViewModel(),
      builder: (context) {
        final viewModel = context.watch<UserViewModel>();
        final money = viewModel.user.account.money;
        return Theme(
          data: infoLightTheme,
          child: Builder(
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Expansion(
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
                ),
              );
            },
          ),
        );
      },
    );
  }
}
