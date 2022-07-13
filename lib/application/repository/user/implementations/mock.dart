import 'package:test_frezux/data/repository/person/natural/mock.dart';
import 'package:test_frezux/domain/entity/person/persons/natural.dart';

import '../user.dart';

class MockUserRepository extends UserRepository {
  Future<NaturalPerson> getUser() {
    return Future.value(mockUser);
  }
}

final mockUser = mockNaturalPersons.values.last;
