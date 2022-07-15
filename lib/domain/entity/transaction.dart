import 'package:money2/money2.dart';
import 'package:bank/domain/entity/person/person.dart';

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
  operator ==(Object other) {
    if (other is! Transaction) return false;
    return id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
