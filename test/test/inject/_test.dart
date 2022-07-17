import 'package:bank/application/helper/last_date_range.dart';
import 'package:bank/application/helper/transaction_participant.dart';
import 'package:bank/application/injection.dart';
import 'package:bank/application/mapper/transaction.dart';
import 'package:bank/application/repository/image/currency/interface.dart';
import 'package:bank/application/repository/image/icon/interface.dart';
import 'package:bank/application/repository/image/logo/interface.dart';
import 'package:bank/application/repository/transaction_details.dart';
import 'package:bank/application/repository/user/interface.dart';
import 'package:bank/data/repository/person/legal/mock.dart';
import 'package:bank/domain/repository/account.dart';
import 'package:bank/domain/repository/currency.dart';
import 'package:bank/domain/repository/person/legal.dart';
import 'package:bank/domain/repository/person/natural.dart';
import 'package:bank/domain/repository/person/person.dart';
import 'package:bank/domain/repository/transaction.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() async {
  final getIt = GetIt.I;
  await inject();
  group("Repository should not throw.", () {
    test("[PersonRepository]", () async {
      final repository = getIt.get<PersonRepository>();
      await repository.getAll();
    });
    test("[LegalPersonRepository]", () async {
      final repository = getIt.get<LegalPersonRepository>();
      await repository.getAll();
    });
    test("[NaturalPersonRepository]", () async {
      final repository = getIt.get<NaturalPersonRepository>();
      await repository.getAll();
    });
    test("[TransactionRepository]", () async {
      final repository = getIt.get<TransactionRepository>();
      await repository.getAll();
    });
    test("[AccountRepository]", () async {
      final repository = getIt.get<AccountRepository>();
      await repository.getAll();
    });
    test("[UserRepository]", () async {
      final repository = getIt.get<UserRepository>();
      await repository.getUser();
    });
    test("[LogoRepository]", () async {
      final repository = getIt.get<LogoRepository>();
      await repository.getByPerson(mockLegalPersons.values.first);
    });
    test("[IconRepository]", () async {
      final repository = getIt.get<IconRepository>();
      for (final direction in TransactionDirection.values)
        await repository.getByDirection(direction);
    });
    test("[TransactionMapper]", () async {
      final transactionRepository = getIt.get<TransactionRepository>();
      final mapper = getIt.get<TransactionMapper>();

      final transactions = await transactionRepository.getAll();
      await mapper.toUserTransaction(transactions.values.first);
    });
    test("[UserTransactionRepository]", () async {
      final repository = getIt.get<UserTransactionRepository>();
      final currencyRepository = getIt.get<CurrencyRepository>();

      final range = LastDateRange.getRange(DateRangeShortcut.all);
      final currency = (await currencyRepository.getAll()).first;
      final request = TransactionRequest(range: range, currency: currency);

      await repository.getAll(request);
    });
    test("[CurrencyRepository]", () async {
      final repository = getIt.get<CurrencyRepository>();
      await repository.getAll();
    });
    test("[PersonRepository]", () async {
      final repository = getIt.get<PersonRepository>();
      await repository.getAll();
    });
    test("[CurrencyImageRepository]", () async {
      final currencyImageRepository = getIt.get<CurrencyImageRepository>();
      final currencyRepository = getIt.get<CurrencyRepository>();

      final currency = (await currencyRepository.getAll()).first;

      await currencyImageRepository.getCurrencyImagePath(currency);
    });
  });
}
