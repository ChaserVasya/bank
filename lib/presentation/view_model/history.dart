import 'package:bank/application/helper/last_date_range.dart';
import 'package:bank/domain/repository/currency.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:money2/money2.dart';
import 'package:bank/application/dto/transaction_context.dart';
import 'package:bank/application/repository/transaction_context.dart';
import 'package:bank/presentation/view_model/awaiting.dart';

class HistoryViewModel extends AwaitingCubit {
  HistoryViewModel() {
    fetch();
  }

  static const _defaultCurrencyCode = "USD";
  static const _defaultShortcut = DateRangeShortcut.day;

  final _transactionRepository = GetIt.I.get<TransactionContextRepository>();
  final _currencyRepository = GetIt.I.get<CurrencyRepository>();

  late List<TransactionContext> _transactions;
  List<TransactionContext> get transactions => _transactions;

  late final List<Currency> _currencies;
  List<Currency> get currencies => _currencies.toList();

  late Currency _currentCurrency;
  Currency get currentCurrency => _currentCurrency;
  set currentCurrency(Currency currency) {
    _currentCurrency = currency;
    request();
  }

  late DateRangeShortcut? _shortcut;
  DateRangeShortcut? get shortcut => _shortcut;

  late DateTimeRange _range;
  DateTimeRange get range => _range;
  set range(DateTimeRange newRange) {
    _shortcut = null;
    _range = newRange;
    request();
  }

  set shortcutRange(DateRangeShortcut shortcut) {
    _shortcut = shortcut;
    _range = LastDateRange.getRange(shortcut);
    request();
  }

  //TODO Refactor. Optimize queries
  Future<void> request([TransactionRequest? request]) async {
    emit(WaitingState.processing);

    request ??= TransactionRequest(
      range: _range,
      currency: _currentCurrency,
    );

    _transactions = await _transactionRepository.getAll(request);

    emit(WaitingState.ready);
  }

  Future<void> fetch() async {
    emit(WaitingState.processing);

    _shortcut = _defaultShortcut;
    _currencies = await _currencyRepository.getAll();
    _currentCurrency = currencies.singleWhere((e) => e.code == _defaultCurrencyCode);

    final defaultRange = LastDateRange.getRange(_defaultShortcut);

    _range = defaultRange;

    final defaultRequest = TransactionRequest(
      range: defaultRange,
      currency: _currentCurrency,
    );

    await request(defaultRequest);

    emit(WaitingState.ready);
  }
}
