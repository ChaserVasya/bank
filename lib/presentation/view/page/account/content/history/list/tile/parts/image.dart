import 'package:flutter/material.dart';

class TransactionTileImage extends StatelessWidget {
  const TransactionTileImage(this.imagePath, {Key? key}) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundImage: ExactAssetImage(imagePath),
    );
  }
}
