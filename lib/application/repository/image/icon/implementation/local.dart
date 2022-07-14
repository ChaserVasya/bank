import 'package:bank/application/helper/transaction_participant.dart';

import '../interface.dart';

class LocalIconRepository extends IconRepository {
  static const _iconFolder = "assets/image/icon";
  static const _extension = "png";
  static const _incomingFile = "incoming";
  static const _outgoingFile = "outgoing";

  @override
  Future<String> getByDirection(TransactionDirection direction) {
    switch (direction) {
      case TransactionDirection.incoming:
        return Future.value(_getFilePath(_incomingFile));
      case TransactionDirection.outgoing:
        return Future.value(_getFilePath(_outgoingFile));
    }
  }

  String _getFilePath(String fileName) {
    return "$_iconFolder/$fileName.$_extension";
  }
}
