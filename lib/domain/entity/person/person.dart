import 'package:flutter/cupertino.dart';
import 'package:bank/domain/entity/account.dart';

abstract class Person {
  final Account account;
  final String name;

  const Person({required this.name, required this.account});

  @override
  operator ==(Object another) {
    if (another is! Person) return false;
    return (this.name == another.name) && (this.account == another.account);
  }

  @override
  int get hashCode => hashValues(name, account);
}
