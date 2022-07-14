import 'package:bank/domain/entity/person/persons/natural.dart';

abstract class UserRepository {
  Future<NaturalPerson> getUser();
}
