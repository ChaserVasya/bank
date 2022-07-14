import 'package:bank/application/helper/transaction_participant.dart';

abstract class IconRepository {
  Future<String> getByDirection(TransactionDirection direction);
}
