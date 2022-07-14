import 'package:get_it/get_it.dart';
import 'package:bank/application/mapper/transaction.dart';
import 'package:bank/application/repository/currency_image/currency_image.dart';
import 'package:bank/application/repository/currency_image/implementation/local.dart';
import 'package:bank/application/repository/logo/implementations/local.dart';
import 'package:bank/application/repository/logo/logo.dart';
import 'package:bank/application/repository/transaction_details.dart';
import 'package:bank/application/repository/user/implementations/mock.dart';
import 'package:bank/application/repository/user/user.dart';
import 'package:bank/data/repository/account/mock.dart';
import 'package:bank/data/repository/person/legal/mock.dart';
import 'package:bank/data/repository/person/natural/mock.dart';
import 'package:bank/data/repository/person/person/mock.dart';
import 'package:bank/data/repository/transaction/mock.dart';
import 'package:bank/domain/repository/account.dart';
import 'package:bank/domain/repository/person/legal.dart';
import 'package:bank/domain/repository/person/natural.dart';
import 'package:bank/domain/repository/person/person.dart';
import 'package:bank/domain/repository/transaction.dart';

Future<void> inject() async {
  final getIt = GetIt.instance;

  //Domain
  getIt.registerSingleton<PersonRepository>(
    MockPersonRepository(),
  );
  getIt.registerSingleton<LegalPersonRepository>(
    MockLegalPersonRepository(),
  );
  getIt.registerSingleton<NaturalPersonRepository>(
    MockNaturalPersonRepository(),
  );
  getIt.registerSingleton<TransactionRepository>(
    MockTransactionRepository(),
  );
  getIt.registerSingleton<AccountRepository>(
    MockAccountRepository(),
  );

  //Application
  getIt.registerSingleton<UserRepository>(
    MockUserRepository(),
  );
  getIt.registerSingleton<LegalPersonLogoRepository>(
    LocalLegalPersonLogoRepository(),
  );
  getIt.registerSingleton<TransactionMapper>(
    TransactionMapper(),
  );
  getIt.registerSingleton<CurrencyImageRepository>(
    LocalCurrencyImageRepository(),
  );
  getIt.registerSingleton<UserTransactionRepository>(
    UserTransactionRepository(),
  );
}
