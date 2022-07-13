import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:test_frezux/application/repository/currency_image/currency_image.dart';
import 'package:test_frezux/application/repository/user/user.dart';
import 'package:test_frezux/domain/entity/person/persons/natural.dart';
import 'package:test_frezux/presentation/view_model/fetch_notifier.dart';

class UserViewModel extends ChangeNotifier implements FetchNotifier {
  late NaturalPerson user;
  late String currencyImagePath;

  final _userRepository = GetIt.I.get<UserRepository>();
  final _currencyImageRepo = GetIt.I.get<CurrencyImageRepository>();

  @override
  Future<void> fetch() async {
    user = await _userRepository.getUser();
    final currency = user.account.money.currency;
    currencyImagePath = await _currencyImageRepo.getCurrencyImagePath(currency);
  }
}
