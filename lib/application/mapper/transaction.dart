import 'package:get_it/get_it.dart';
import 'package:test_frezux/application/dto/user_transaction.dart';
import 'package:test_frezux/application/helper/transaction_participant.dart';
import 'package:test_frezux/application/repository/logo/logo.dart';
import 'package:test_frezux/application/repository/user/user.dart';
import 'package:test_frezux/domain/entity/person/persons/legal.dart';
import 'package:test_frezux/domain/entity/person/persons/natural.dart';
import 'package:test_frezux/domain/entity/transaction.dart';

class TransactionMapper {
  final _legalPersonLogoRepository = GetIt.I.get<LegalPersonLogoRepository>();
  final _userRepository = GetIt.I.get<UserRepository>();

  static const String _incomingLogoPath = "assets/images/logos/incoming.png";
  static const String _outgoingLogoPath = "assets/images/logos/outgoing.png";

  Future<UserTransaction> toUserTransaction(Transaction transaction) async {
    final user = await _userRepository.getUser();

    final participant = transaction.participant(user);

    if (participant == null)
      throw Exception("User doesn`t participate in the transaction");

    final anotherParticipant = participant.another();

    return UserTransaction(
      direction: transaction.relativeTo(user)!,
      dateTime: transaction.dateTime,
      anotherParticipantName: anotherParticipant.person.name,
      anotherParticipantLogoPath: _chooseLogoPath(anotherParticipant),
      amount: transaction.amount,
    );
  }

  String _chooseLogoPath(TransactionParticipant anotherParticipant) {
    final anotherPerson = anotherParticipant.person;
    final role = anotherParticipant.role;

    if (anotherPerson is LegalPerson) {
      return _legalPersonLogoRepository.getByPerson(anotherPerson);
    } else if (anotherPerson is NaturalPerson) {
      if (role == ParticipantRole.sender)
        return _incomingLogoPath;
      else if (role == ParticipantRole.receiver) {
        return _outgoingLogoPath;
      }
    }

    throw Exception("Must be never reached");
  }
}
