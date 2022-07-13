import 'package:test_frezux/data/repository/account/mock.dart';
import 'package:test_frezux/domain/entity/person/persons/natural.dart';
import 'package:test_frezux/domain/repository/person/natural.dart';

class MockNaturalPersonRepository extends NaturalPersonRepository {
  @override
  Future<Map<int, NaturalPerson>> getAll() =>
      Future.value(Map.from(mockNaturalPersons));

  @override
  Future<NaturalPerson> getByID(int id) =>
      Future.value(mockNaturalPersons[id]!);
}

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
