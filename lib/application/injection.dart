import 'package:get_it/get_it.dart';
import 'package:test_frezux/application/repository/logo/implementations/local.dart';
import 'package:test_frezux/application/repository/logo/logo.dart';
import 'package:test_frezux/application/repository/user/implementations/mock.dart';
import 'package:test_frezux/application/repository/user/user.dart';
import 'package:test_frezux/data/repository/person/legal/mock.dart';
import 'package:test_frezux/data/repository/person/natural/mock.dart';
import 'package:test_frezux/data/repository/person/person/mock.dart';
import 'package:test_frezux/data/repository/transaction/mock.dart';
import 'package:test_frezux/domain/repository/person/legal.dart';
import 'package:test_frezux/domain/repository/person/natural.dart';
import 'package:test_frezux/domain/repository/person/person.dart';
import 'package:test_frezux/domain/repository/transaction.dart';

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

  //Application
  getIt.registerSingleton<UserRepository>(
    MockUserRepository(),
  );
  getIt.registerSingleton<LegalPersonLogoRepository>(
    LocalLegalPersonLogoRepository(),
  );
  getIt.registerSingleton<UserRepository>(
    MockLocalUserRepository(),
  );
  getIt.registerSingleton<UserRepository>(
    MockLocalUserRepository(),
  );
}
