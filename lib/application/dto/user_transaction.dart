import 'package:money2/money2.dart';
import 'package:test_frezux/application/helper/transaction_participant.dart';

class UserTransaction {
  final TransactionDirection direction;
  final String anotherParticipantLogoPath;
  final String anotherParticipantName;
  final Money amount;
  final DateTime dateTime;

  const UserTransaction({
    required this.direction,
    required this.anotherParticipantLogoPath,
    required this.anotherParticipantName,
    required this.amount,
    required this.dateTime,
  });
}
