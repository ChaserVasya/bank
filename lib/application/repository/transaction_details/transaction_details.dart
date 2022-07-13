import 'package:test_frezux/application/dto/user_transaction.dart';

abstract class UserTransactionRepository {
  Future<List<UserTransaction>> getAll();

  Future<UserTransaction> getByID(int id);
}
