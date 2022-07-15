import 'package:flutter/cupertino.dart';
import 'package:bank/domain/entity/account.dart';

abstract class Person {
  final Account account;
  final String name;

  const Person({required this.name, required this.account});

  @override
  operator ==(Object other) {
    if (other is! Person) return false;
    return (name == other.name) && (account == other.account);
  }

  @override
  int get hashCode => hashValues(name, account);
}
