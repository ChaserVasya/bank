import 'package:test_frezux/domain/entity/person/persons/natural.dart';

abstract class UserRepository {
  Future<NaturalPerson> getUser();
}
