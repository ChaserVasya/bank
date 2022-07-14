import 'package:money2/money2.dart';

//This repository is in application layer because it adapts for some
//presentation details
abstract class CurrencyImageRepository {
  //Not string because [Image.asset] uses path, not binary
  Future<String> getCurrencyImagePath(Currency currency);
}
