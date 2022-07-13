import 'package:money2/money2.dart';
import 'package:test_frezux/domain/entity/account.dart';
import 'package:test_frezux/domain/repository/account.dart';

class MockAccountRepository extends AccountRepository {
  @override
  Future<Map<int, Account>> getAll() => Future.value(Map.from(mockAccounts));

  @override
  Future<Account> getByID(int id) => Future.value(mockAccounts[id]!);
}

final mockAccounts = {
  1: Account(
    id: 1,
    money: Money.parseWithCurrency(
      "532.44",
      Currencies().find("USD")!,
    ),
  ),
  2: Account(
    id: 2,
    money: Money.parseWithCurrency(
      "1234123.12",
      Currencies().find("USD")!,
    ),
  ),
  3: Account(
    id: 3,
    money: Money.parseWithCurrency(
      "666.12",
      Currencies().find("USD")!,
    ),
  ),
  4: Account(
    id: 4,
    money: Money.parseWithCurrency(
      "5.12",
      Currencies().find("USD")!,
    ),
  ),
  5: Account(
    id: 5,
    money: Money.parseWithCurrency(
      "12323.01",
      Currencies().find("USD")!,
    ),
  ),
  6: Account(
    id: 6,
    money: Money.parseWithCurrency(
      "12323.1",
      Currencies().find("USD")!,
    ),
  ),
  7: Account(
    id: 7,
    money: Money.parseWithCurrency(
      "12323",
      Currencies().find("USD")!,
    ),
  ),
  8: Account(
    id: 8,
    money: Money.parseWithCurrency(
      "0.12",
      Currencies().find("USD")!,
    ),
  ),
  9: Account(
    id: 9,
    money: Money.parseWithCurrency(
      "12323.12",
      Currencies().find("USD")!,
    ),
  ),
  10: Account(
    id: 10,
    money: Money.parseWithCurrency(
      "12323.12",
      Currencies().find("USD")!,
    ),
  ),
};
