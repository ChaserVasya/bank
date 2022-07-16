import 'package:bank/application/helper/text/date_time_range_format.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:bank/application/dto/user_transaction.dart';
import 'package:bank/application/mapper/transaction.dart';
import 'package:bank/domain/repository/transaction.dart';
import 'package:money2/money2.dart';

class UserTransactionRepository {
  final _repository = GetIt.I.get<TransactionRepository>();
  final _mapper = GetIt.I.get<TransactionMapper>();

  ///TODO Refactor. Optimize queries
  Future<List<UserTransaction>> getAll(TransactionRequest request) async {
    final transactions = await _repository.getAll();

    List<UserTransaction> detailsList = [];
    for (final transaction in transactions.values) {
      final details = await _mapper.toUserTransaction(transaction);
      detailsList.add(details);
    }

    return _cleanUp(detailsList, request);
  }

  Future<UserTransaction> getByID(int id) async {
    final transaction = await _repository.getByID(id);
    return await _mapper.toUserTransaction(transaction);
  }

  List<UserTransaction> _cleanUp(
    List<UserTransaction> transactions,
    TransactionRequest request,
  ) {
    return transactions
        .where((e) => e.amount.currency == request.currency)
        .where((e) => request.range.includes(e.dateTime))
        .toList()
      ..sort(
        (one, another) => one.dateTime.isBefore(another.dateTime)
            ? 1
            : one.dateTime.isAtSameMomentAs(another.dateTime)
                ? 0
                : -1,
      );
  }
}

class TransactionRequest {
  final DateTimeRange range;
  final Currency currency;

  TransactionRequest({
    required this.range,
    required this.currency,
  });
}
