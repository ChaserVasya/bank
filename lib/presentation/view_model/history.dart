import 'package:bank/application/helper/last_date_range.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:money2/money2.dart';
import 'package:bank/application/dto/user_transaction.dart';
import 'package:bank/application/repository/transaction_details.dart';
import 'package:bank/presentation/view_model/fetch_notifier.dart';

class HistoryViewModel extends ChangeNotifier implements FetchNotifier {
  final _repository = GetIt.I.get<UserTransactionRepository>();

  late List<UserTransaction> _transactions;
  List<UserTransaction> get transactions => _transactions;

  late var _currency = Currencies().find("USD")!;
  Currency get currency => _currency;
  set currency(Currency currency) {
    _currency = currency;
    notifyListeners();
    fetch();
  }

  late DateRangeShortcut? _shortcut = DateRangeShortcut.day;
  DateRangeShortcut? get shortcut => _shortcut;

  late var _range = LastDateRange.getRange(_shortcut!);
  DateTimeRange get range => _range;
  set range(DateTimeRange newRange) {
    _shortcut = null;
    _range = newRange;
    notifyListeners();
    fetch();
  }

  set shortcutRange(DateRangeShortcut shortcut) {
    _shortcut = shortcut;
    _range = LastDateRange.getRange(shortcut);
    notifyListeners();
    fetch();
  }

  ///TODO Refactor. Optimize queries
  @override
  Future<void> fetch() async {
    final request = TransactionRequest(
      range: range,
      currency: currency,
    );

    _transactions = await _repository.getAll(request);

    notifyListeners();
  }
}

enum DateRangeShortcut {
  day,
  week,
  month,
  all,
}
