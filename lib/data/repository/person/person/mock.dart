import 'package:bank/data/repository/person/legal/mock.dart';
import 'package:bank/data/repository/person/natural/mock.dart';
import 'package:bank/domain/entity/person/person.dart';
import 'package:bank/domain/repository/person/person.dart';

class MockPersonRepository extends PersonRepository {
  @override
  Future<Map<int, Person>> getAll() {
    Map<int, Person> merged = {};

    merged.addAll(mockNaturalPersons);
    merged.addAll(mockLegalPersons);

    return Future.value(merged);
  }

  @override
  Future<Person> getByID(int id) async {
    final all = await getAll();
    return Future.value(all[id]!);
  }
}
