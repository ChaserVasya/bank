import 'package:flutter/material.dart';

class CompanyLogo extends StatelessWidget {
  const CompanyLogo(this.logoPath, {Key? key}) : super(key: key);

  final String logoPath;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Image.asset(logoPath),
    );
  }
}
