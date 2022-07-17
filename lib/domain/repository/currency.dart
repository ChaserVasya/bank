import 'package:money2/money2.dart';

abstract class CurrencyRepository {
  Future<List<Currency>> getAll();
  Future<Currency?> getByCode(String code);
}
