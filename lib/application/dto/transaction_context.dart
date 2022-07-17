import 'package:money2/money2.dart';
import 'package:bank/application/helper/transaction_participant.dart';

class TransactionContext {
  final TransactionDirection direction;
  final String imagePath;
  final String anotherParticipantName;
  final Money amount;
  final DateTime dateTime;

  const TransactionContext({
    required this.direction,
    required this.imagePath,
    required this.anotherParticipantName,
    required this.amount,
    required this.dateTime,
  });
}
