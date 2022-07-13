import 'package:money2/money2.dart';
import 'package:test_frezux/domain/entity/transaction.dart';
import 'package:test_frezux/domain/repository/transaction.dart';

class MockTransactionRepository extends TransactionRepository {
  @override
  Future<Map<int, Transaction>> getAll() {}

  @override
  Future<Transaction> getByID(int id) {}
}

final mockTransactions = {
  1: Transaction(
    id: 1,
    amount: Money.parseWithCurrency(
      "2312.13",
      currency,
    ),
  ),
};
