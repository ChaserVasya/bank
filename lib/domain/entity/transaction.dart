import 'package:money2/money2.dart';
import 'package:test_frezux/domain/entity/person/person.dart';

class Transaction {
  final int id;
  final DateTime dateTime;
  final Money amount;
  final Person receiver;
  final Person sender;

  const Transaction({
    required this.id,
    required this.dateTime,
    required this.amount,
    required this.receiver,
    required this.sender,
  });

  @override
  operator ==(Object another) {
    if (another is! Transaction) return false;
    return this.id == another.id;
  }

  @override
  int get hashCode => id.hashCode;
}
