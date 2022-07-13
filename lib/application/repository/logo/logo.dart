import 'package:test_frezux/domain/entity/person/persons/legal.dart';

abstract class LegalPersonLogoRepository {
  String getByPerson(LegalPerson person);
}
