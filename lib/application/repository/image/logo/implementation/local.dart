import 'package:bank/domain/entity/person/persons/legal.dart';

import '../interface.dart';

class LocalLogoRepository extends LogoRepository {
  static const _logosFolderPath = "assets/image/logo";
  static const _extension = "jpg";

  @override
  Future<String> getByPerson(LegalPerson person) async {
    final fileName = person.account.id.toString();
    return "$_logosFolderPath/$fileName.$_extension";
  }
}
