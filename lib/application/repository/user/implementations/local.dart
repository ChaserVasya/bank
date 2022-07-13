import 'package:test_frezux/domain/entity/person/persons/natural.dart';

import '../user.dart';

class LocalUserRepository extends UserRepository {
  Future<NaturalPerson> getUser();
}
