import 'package:test_frezux/domain/entity/person/persons/legal.dart';

import '../logo.dart';

class LocalLegalPersonLogoRepository extends LegalPersonLogoRepository {
  static const _logosFolderPath = "assets/images/logos";
  static const _extension = "jpg";

  String getByPerson(LegalPerson person) {
    final fileName = person.account.id.toString();
    return "$_logosFolderPath/$fileName.$_extension";
  }
}
