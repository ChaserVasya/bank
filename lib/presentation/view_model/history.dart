import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:money2/money2.dart';
import 'package:test_frezux/application/dto/user_transaction.dart';
import 'package:test_frezux/application/repository/transaction_details.dart';
import 'package:test_frezux/presentation/view_model/fetch_notifier.dart';

class HistoryViewModel extends ChangeNotifier implements FetchNotifier {
  final _repository = GetIt.I.get<UserTransactionRepository>();

  late List<UserTransaction> _transactions;
  List<UserTransaction> get transactions => _transactions;

  late Currency _currency;
  Currency get currency => _currency;
  set currency(Currency currency) {
    _currency = currency;
    notifyListeners();
  }

  late DateRangeShortcut? _shortcut;
  DateRangeShortcut? get shortcut => _shortcut;

  late DateTimeRange _range;
  DateTimeRange get range => _range;
  set range(DateTimeRange newRange) {
    _shortcut = null;
    _range = newRange;
    notifyListeners();
  }

  set shortcutRange(DateRangeShortcut shortcut) {
    _shortcut = shortcut;
    _range = LastDateRange.getRange(shortcut);
    notifyListeners();
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
  }
}

enum DateRangeShortcut {
  day,
  week,
  month,
  all,
}

extension DateTimeRangeUtils on DateTimeRange {
  bool includes(DateTime dateTime) {
    return (start.isBefore(dateTime) && end.isAfter(dateTime)) ||
        start.isAtSameMomentAs(dateTime) ||
        end.isAtSameMomentAs(dateTime);
  }
}

class LastDateRange {
  static const _day = Duration(days: 1);
  static const _week = Duration(days: 7);
  static const _month = Duration(days: 30);
  static const _max = Duration(days: 365 * 200);

  static DateTimeRange getRange(DateRangeShortcut shortcut) {
    final end = DateTime.now();

    late final DateTime start;
    switch (shortcut) {
      case DateRangeShortcut.day:
        start = end.subtract(_day);
        break;
      case DateRangeShortcut.week:
        start = end.subtract(_week);
        break;
      case DateRangeShortcut.month:
        start = end.subtract(_month);
        break;
      case DateRangeShortcut.all:
        start = end.subtract(_max);
        break;
    }

    return DateTimeRange(start: start, end: end);
  }

  static DateTimeRange get max {
    return getRange(DateRangeShortcut.all);
  }
}
