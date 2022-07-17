import 'package:flutter/material.dart';

//TODO rename file
abstract class AwaitingNotifier extends ChangeNotifier {
  Future<void>? processing;
}
