import 'package:flutter/material.dart';

abstract class FetchNotifier extends ChangeNotifier {
  Future<void> fetch();
}
