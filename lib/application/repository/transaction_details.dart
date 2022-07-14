import 'package:get_it/get_it.dart';
import 'package:bank/application/dto/user_transaction.dart';
import 'package:bank/application/mapper/transaction.dart';
import 'package:bank/domain/repository/transaction.dart';

class UserTransactionRepository {
  final _repository = GetIt.I.get<TransactionRepository>();
  final _mapper = GetIt.I.get<TransactionMapper>();

  ///TODO Refactor. Optimize queries
  Future<List<UserTransaction>> getAll() async {
    final transactions = await _repository.getAll();

    List<UserTransaction> detailsList = [];
    for (final transaction in transactions.values) {
      final details = await _mapper.toUserTransaction(transaction);
      detailsList.add(details);
    }

    return detailsList;
  }

  Future<UserTransaction> getByID(int id) async {
    final transaction = await _repository.getByID(id);
    return await _mapper.toUserTransaction(transaction);
  }
}
