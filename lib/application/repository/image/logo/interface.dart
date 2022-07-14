import 'package:bank/domain/entity/person/persons/legal.dart';

abstract class LogoRepository {
  Future<String> getByPerson(LegalPerson person);
}
