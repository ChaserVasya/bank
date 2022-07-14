import 'package:bank/data/repository/person/natural/mock.dart';
import 'package:bank/domain/entity/person/persons/natural.dart';

import '../interface.dart';

class MockUserRepository extends UserRepository {
  Future<NaturalPerson> getUser() {
    return Future.value(mockUser);
  }
}

final mockUser = mockNaturalPersons.values.last;
