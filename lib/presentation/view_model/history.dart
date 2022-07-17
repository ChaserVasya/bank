import 'package:bank/application/helper/last_date_range.dart';
import 'package:bank/domain/repository/currency.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:money2/money2.dart';
import 'package:bank/application/dto/user_transaction.dart';
import 'package:bank/application/repository/transaction_details.dart';
import 'package:bank/presentation/view_model/awaiting_notifier.dart';

class HistoryViewModel extends AwaitingNotifier {
  HistoryViewModel() {
    processing = fetch();
  }

  static const _defaultCurrencyCode = "USD";
  static const _defaultShortcut = DateRangeShortcut.day;

  final _transactionRepository = GetIt.I.get<UserTransactionRepository>();
  final _currencyRepository = GetIt.I.get<CurrencyRepository>();

  late List<UserTransaction> _transactions;
  List<UserTransaction> get transactions => _transactions;

  late List<Currency> currencies;
  late Currency _currentCurrency;
  Currency get currentCurrency => _currentCurrency;
  set currentCurrency(Currency currency) {
    _currentCurrency = currency;
    notifyListeners();
    processing = request();
  }

  late DateRangeShortcut? _shortcut;
  DateRangeShortcut? get shortcut => _shortcut;

  late DateTimeRange _range;
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
  Future<List<UserTransaction>> request([TransactionRequest? request]) async {
    request ??= TransactionRequest(
      range: _range,
      currency: _currentCurrency,
    );

    _transactions = await _transactionRepository.getAll(request);

    notifyListeners();

    return _transactions;
  }

  Future<void> fetch() async {
    _shortcut = _defaultShortcut;
    currencies = await _currencyRepository.getAll();
    _currentCurrency = currencies.singleWhere((e) => e.code == _defaultCurrencyCode);

    final defaultRequest = TransactionRequest(
      range: LastDateRange.getRange(_defaultShortcut),
      currency: _currentCurrency,
    );

    await request(defaultRequest);
  }
}
