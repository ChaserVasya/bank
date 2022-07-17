import 'package:bank/domain/repository/currency.dart';
import 'package:money2/money2.dart';

class LocalCurrencyRepository extends CurrencyRepository {
  final _allowedCodes = [
    "USD",
    "RUB",
  ];

  @override
  Future<List<Currency>> getAll() async {
    final all = Currencies().getRegistered();
    return all.where((e) => _allowedCodes.contains(e.code)).toList();
  }

  @override
  Future<Currency?> getByCode(String code) async {
    final all = await getAll();
    return all.singleWhere((e) => e.code == code);
  }

  @override
  List<Currency>? getAllCached() {
    final all = Currencies().getRegistered();
    return all.where((e) => _allowedCodes.contains(e.code)).toList();
  }

  @override
  Currency? getCachedByCode(String code) {
    final all = getAllCached();
    return all!.singleWhere((e) => e.code == code);
  }

  @override
  Future<List<Currency>?> fetch() async => await getAll();
}
