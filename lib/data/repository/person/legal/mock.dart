import 'package:money2/money2.dart';
import 'package:test_frezux/data/repository/account/mock.dart';
import 'package:test_frezux/domain/entity/account.dart';
import 'package:test_frezux/domain/entity/person/persons/legal.dart';
import 'package:test_frezux/domain/repository/person/legal.dart';
import 'package:decimal/decimal.dart';

class MoskLegalPersonRepository extends LegalPersonRepository {
  @override
  Future<Map<int, LegalPerson>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<LegalPerson> getByID(int id) {
    // TODO: implement getByID
    throw UnimplementedError();
  }
}

final Map<int, LegalPerson> mockNaturalPersons = {
  mockAccounts[4]!.id: LegalPerson(
    name: "Pret A Manger",
    account: mockAccounts[4]!,
  ),
  mockAccounts[5]!.id: LegalPerson(
    name: "McDonalds",
    account: mockAccounts[5]!,
  ),
  mockAccounts[6]!.id: LegalPerson(
    name: "Starbucks",
    account: mockAccounts[6]!,
  ),
  mockAccounts[7]!.id: LegalPerson(
    name: "Virgin Megastore",
    account: mockAccounts[7]!,
  ),
  mockAccounts[8]!.id: LegalPerson(
    name: "Nike",
    account: mockAccounts[8]!,
  ),
  mockAccounts[9]!.id: LegalPerson(
    name: "Louis Vuitton",
    account: mockAccounts[9]!,
  ),
  mockAccounts[10]!.id: LegalPerson(
    name: "Carrefour",
    account: mockAccounts[10]!,
  ),
};