import 'package:bank/application/helper/transaction_participant.dart';

extension TransactionDirectionUtils on TransactionDirection {
  String toSign() {
    switch (this) {
      case TransactionDirection.incoming:
        return '+';
      case TransactionDirection.outgoing:
        return '-';
    }
  }
}
