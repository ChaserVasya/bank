import 'package:test_frezux/data/repository/person/legal/mock.dart';
import 'package:test_frezux/data/repository/person/natural/mock.dart';
import 'package:test_frezux/domain/entity/person/person.dart';
import 'package:test_frezux/domain/repository/person/person.dart';

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
