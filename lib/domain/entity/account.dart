import 'package:money2/money2.dart';

class Account {
  final int id;
  final Money money;

  const Account({required this.id, required this.money});

  @override
  operator ==(Object other) {
    if (other is! Account) return false;
    return id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
