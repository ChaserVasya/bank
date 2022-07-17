import 'package:bank/application/helper/last_date_range.dart';
import 'package:bank/domain/repository/currency.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:money2/money2.dart';
import 'package:bank/application/dto/user_transaction.dart';
import 'package:bank/application/repository/transaction_details.dart';
import 'package:bank/presentation/view_model/fetch_notifier.dart';

class HistoryViewModel extends AwaitingNotifier {
  HistoryViewModel() {
    processing = fetch();
  }

  final _repository = GetIt.I.get<UserTransactionRepository>();
  final _currencyRepository = GetIt.I.get<CurrencyRepository>();

  late List<UserTransaction> _transactions;
  List<UserTransaction> get transactions => _transactions;

  late List<Currency> currencies;
  late Currency _currency;
  Currency get currency => _currency;
  set currency(Currency currency) {
    _currency = currency;
    notifyListeners();
    processing = request();
  }

  late DateRangeShortcut? _shortcut = DateRangeShortcut.day;
  DateRangeShortcut? get shortcut => _shortcut;

  late var _range = LastDateRange.getRange(_shortcut!);
  DateTimeRange get range => _range;
  set range(DateTimeRange newRange) {
    _shortcut = null;
    _range = newRange;
    processing = request();
    notifyListeners();
  }

  set shortcutRange(DateRangeShortcut shortcut) {
    _shortcut = shortcut;
    _range = LastDateRange.getRange(shortcut);
    processing = request();
    notifyListeners();
  }

  //TODO Refactor. Optimize queries
  Future<void> request() async {
    final request = TransactionRequest(
      range: range,
      currency: currency,
    );

    _transactions = await _repository.getAll(request);

    notifyListeners();
  }

  Future<void> fetch() async {
    currencies = await _currencyRepository.getAll();
    currency = currencies.singleWhere((e) => e.code == "USD");
  }
}
