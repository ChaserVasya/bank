import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:bank/application/repository/user/interface.dart';
import 'package:bank/domain/entity/person/person.dart';
import 'package:bank/domain/entity/transaction.dart';

extension RelativeTransaction on Transaction {
  TransactionDirection? relativeTo(Person person) {
    if (person.account == sender.account) return TransactionDirection.outgoing;
    if (person.account == receiver.account) return TransactionDirection.incoming;
    return null;
  }

  Future<TransactionDirection?> relativeToUser() async {
    final user = await GetIt.I.get<UserRepository>().getUser();
    return relativeTo(user);
  }

  TransactionParticipant? participant(Person person) {
    if ((receiver == person) || (sender == person)) return TransactionParticipant._(this, person);
    return null;
  }
}

class TransactionParticipant {
  final Transaction transaction;
  final Person person;

  TransactionParticipant._(this.transaction, this.person);

  ParticipantRole get role {
    if (transaction.sender == person) return ParticipantRole.sender;
    if (transaction.receiver == person) return ParticipantRole.receiver;
    throw Exception("Must be never reached");
  }

  TransactionParticipant another() {
    switch (role) {
      case ParticipantRole.sender:
        return TransactionParticipant._(transaction, transaction.receiver);
      case ParticipantRole.receiver:
        return TransactionParticipant._(transaction, transaction.sender);
    }
  }

  @override
  operator ==(Object other) {
    if (other is! TransactionParticipant) return false;
    return (person == other.person) && (transaction == other.transaction);
  }

  @override
  int get hashCode => hashValues(person, transaction);
}

enum ParticipantRole {
  sender,
  receiver,
}

enum TransactionDirection {
  incoming,
  outgoing,
}
