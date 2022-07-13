import 'package:money2/money2.dart';
import 'package:test_frezux/domain/entity/account.dart';
import 'package:test_frezux/domain/repository/account.dart';

class MockAccountRepository extends AccountRepository {}

final mockAccounts = {
  1: Account(
    id: 1,
    money: Money.parse(
      "532.44",
      code: "US",
    ),
  ),
  2: Account(
    id: 2,
    money: Money.parseWithCurrency
      "1234123.12",
      code: "US",
    ),
  ),
  3: Account(
    id: 3,
    money: Money.parse(
      "666.12",
      code: "US",
    ),
  ),
  4: Account(
    id: 4,
    money: Money.parse(
      "5.12",
      code: "US",
    ),
  ),
  5: Account(
    id: 5,
    money: Money.parse(
      "12323.01",
      code: "US",
    ),
  ),
  6: Account(
    id: 6,
    money: Money.parse(
      "12323.1",
      code: "US",
    ),
  ),
  7: Account(
    id: 7,
    money: Money.parse(
      "12323",
      code: "US",
    ),
  ),
  8: Account(
    id: 8,
    money: Money.parse(
      "0.12",
      code: "US",
    ),
  ),
  9: Account(
    id: 9,
    money: Money.parse(
      "12323.12",
      code: "US",
    ),
  ),
  10: Account(
    id: 10,
    money: Money.parse(
      "12323.12",
      code: "US",
    ),
  ),
};
