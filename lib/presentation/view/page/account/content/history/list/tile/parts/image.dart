import 'package:flutter/material.dart';

class TransactionTileImage extends StatelessWidget {
  const TransactionTileImage(this.imagePath, {Key? key}) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      foregroundImage: ExactAssetImage(imagePath),
    );
  }
}
