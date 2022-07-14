import 'package:bank/application/repository/image/icon/interface.dart';
import 'package:bank/application/repository/image/logo/interface.dart';
import 'package:get_it/get_it.dart';
import 'package:bank/application/dto/user_transaction.dart';
import 'package:bank/application/helper/transaction_participant.dart';
import 'package:bank/application/repository/user/interface.dart';
import 'package:bank/domain/entity/person/persons/legal.dart';
import 'package:bank/domain/entity/person/persons/natural.dart';
import 'package:bank/domain/entity/transaction.dart';

import '../../domain/entity/person/person.dart';

class TransactionMapper {
  final _logoRepository = GetIt.I.get<LogoRepository>();
  final _userRepository = GetIt.I.get<UserRepository>();
  final _iconRepository = GetIt.I.get<IconRepository>();

  Future<UserTransaction> toUserTransaction(Transaction transaction) async {
    final user = await _userRepository.getUser();

    final participant = transaction.participant(user);

    if (participant == null)
      throw Exception("User doesn`t participate in the transaction");

    final anotherParticipant = participant.another();
    final direction = transaction.relativeTo(user)!;

    return UserTransaction(
      direction: direction,
      dateTime: transaction.dateTime,
      anotherParticipantName: anotherParticipant.person.name,
      imagePath: await _chooseImagePath(anotherParticipant.person, direction),
      amount: transaction.amount,
    );
  }

  Future<String> _chooseImagePath(
    Person anotherPerson,
    TransactionDirection direction,
  ) async {
    if (anotherPerson is LegalPerson)
      return _logoRepository.getByPerson(anotherPerson);
    else if (anotherPerson is NaturalPerson)
      return _iconRepository.getByDirection(direction);

    throw Exception("Must be never reached");
  }
}
