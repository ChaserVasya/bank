import 'package:test_frezux/data/repository/account/mock.dart';
import 'package:test_frezux/domain/entity/person/persons/natural.dart';

class MoskLegalPersonLogoRepository extends LegalPersonLogoRepository {}

final Map<int, NaturalPerson> mockNaturalPersons = {
  mockAccounts[1]!.id: NaturalPerson(
    name: "Darren Hodgkin",
    account: mockAccounts[1]!,
  ),
  mockAccounts[2]!.id: NaturalPerson(
    name: "Dave Winklevoss",
    account: mockAccounts[2]!,
  ),
  mockAccounts[3]!.id: NaturalPerson(
    name: "Vasya",
    account: mockAccounts[3]!,
  ),
};
