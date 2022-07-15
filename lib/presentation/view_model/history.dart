import 'package:bank/application/helper/last_date_range.dart';
import 'package:bank/application/helper/text/date_time_range_format.dart';
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

  ///TODO Refactor. Move filtering logic to application layer
  ///TODO Refactor. Optimize queries
  @override
  Future<void> fetch() async {
    _transactions = await _repository.getAll();
    _transactions = _transactions
        .where((e) => e.amount.currency == currency)
        .where((e) => range.includes(e.dateTime))
        .toList()
      ..sort(
        (one, another) => one.dateTime.isBefore(another.dateTime)
            ? 1
            : one.dateTime.isAtSameMomentAs(another.dateTime)
                ? 0
                : -1,
      );

    notifyListeners();
  }
}

enum DateRangeShortcut {
  day,
  week,
  month,
  all,
}
