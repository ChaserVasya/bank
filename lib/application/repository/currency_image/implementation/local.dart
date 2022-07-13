import 'package:money2/money2.dart';

import '../currency_image.dart';

class MoskCurrencyImageRepository extends CurrencyImageRepository {
  static const _currencyImageFolder = "assets/images/currency";
  static const _extension = "jpg";

  Future<String> getCurrencyImagePath(Currency currency) async {
    final code = currency.code;
    return "$_currencyImageFolder/$code.$_extension";
  }
}
