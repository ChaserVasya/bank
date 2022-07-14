import 'package:money2/money2.dart';
import 'package:bank/application/repository/user/implementations/mock.dart';
import 'package:bank/data/repository/person/legal/mock.dart';
import 'package:bank/data/repository/person/natural/mock.dart';
import 'package:bank/domain/entity/transaction.dart';
import 'package:bank/domain/repository/transaction.dart';

class MockTransactionRepository extends TransactionRepository {
  @override
  Future<Map<int, Transaction>> getAll() =>
      Future.value(Map.from(mockTransactions));

  @override
  Future<Transaction> getByID(int id) => Future.value(mockTransactions[id]!);
}

final mockTransactions = {
  1: Transaction(
    id: 1,
    amount: Money.parseWithCurrency(
      "2312.13",
      Currencies().find("USD")!,
    ),
    dateTime: DateTime.now().subtract(Duration(days: 1, hours: 2)),
    receiver: mockLegalPersons[4]!,
    sender: mockUser,
  ),
  2: Transaction(
    id: 2,
    amount: Money.parseWithCurrency(
      "2312.13",
      Currencies().find("USD")!,
    ),
    dateTime: DateTime.now().subtract(Duration(days: 1, hours: 3)),
    receiver: mockUser,
    sender: mockNaturalPersons[1]!,
  ),
  3: Transaction(
    id: 3,
    amount: Money.parseWithCurrency(
      "23.13",
      Currencies().find("USD")!,
    ),
    dateTime: DateTime.now().subtract(Duration(days: 1, hours: 4)),
    receiver: mockLegalPersons[5]!,
    sender: mockUser,
  ),
  4: Transaction(
    id: 4,
    amount: Money.parseWithCurrency(
      "2312.13",
      Currencies().find("USD")!,
    ),
    dateTime: DateTime.now().subtract(Duration(days: 1, hours: 5)),
    receiver: mockLegalPersons[6]!,
    sender: mockUser,
  ),
  5: Transaction(
    id: 5,
    amount: Money.parseWithCurrency(
      "222.13",
      Currencies().find("USD")!,
    ),
    dateTime: DateTime.now().subtract(Duration(days: 1, hours: 8)),
    receiver: mockUser,
    sender: mockNaturalPersons[2]!,
  ),
  6: Transaction(
    id: 6,
    amount: Money.parseWithCurrency(
      "111.13",
      Currencies().find("USD")!,
    ),
    dateTime: DateTime.now().subtract(Duration(days: 2, minutes: 10)),
    receiver: mockLegalPersons[7]!,
    sender: mockUser,
  ),
  7: Transaction(
    id: 7,
    amount: Money.parseWithCurrency(
      "54.13",
      Currencies().find("USD")!,
    ),
    dateTime: DateTime.now().subtract(Duration(days: 2, minutes: 50)),
    receiver: mockLegalPersons[8]!,
    sender: mockUser,
  ),
  8: Transaction(
    id: 8,
    amount: Money.parseWithCurrency(
      "11",
      Currencies().find("USD")!,
    ),
    dateTime: DateTime.now().subtract(Duration(days: 4, hours: 4, minutes: 3)),
    receiver: mockLegalPersons[9]!,
    sender: mockUser,
  ),
  9: Transaction(
    id: 9,
    amount: Money.parseWithCurrency(
      "500.13",
      Currencies().find("USD")!,
    ),
    dateTime: DateTime.now().subtract(Duration(days: 4, hours: 7, minutes: 50)),
    receiver: mockLegalPersons[10]!,
    sender: mockUser,
  ),
};
