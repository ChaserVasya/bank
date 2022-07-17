import 'package:bank/application/repository/image/currency/interface.dart';
import 'package:bank/presentation/view_model/fetch_notifier.dart';
import 'package:get_it/get_it.dart';
import 'package:bank/application/repository/user/interface.dart';
import 'package:bank/domain/entity/person/persons/natural.dart';

class UserViewModel extends AwaitingNotifier {
  UserViewModel() {
    processing = fetch();
  }

  late NaturalPerson user;
  late String currencyImagePath;

  final _userRepository = GetIt.I.get<UserRepository>();
  final _currencyImageRepo = GetIt.I.get<CurrencyImageRepository>();

  Future<void> fetch() async {
    user = await _userRepository.getUser();
    final currency = user.account.money.currency;
    currencyImagePath = await _currencyImageRepo.getCurrencyImagePath(currency);
  }
}
