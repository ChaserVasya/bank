import 'package:bank/domain/entity/person/persons/legal.dart';

abstract class LegalPersonLogoRepository {
  String getByPerson(LegalPerson person);
}
