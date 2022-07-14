import 'package:money2/money2.dart';

import '../interface.dart';

class LocalCurrencyImageRepository extends CurrencyImageRepository {
  static const _currencyImageFolder = "assets/image/currency";
  static const _extension = "jpg";

  Future<String> getCurrencyImagePath(Currency currency) async {
    final code = currency.code;
    return "$_currencyImageFolder/$code.$_extension";
  }
}
