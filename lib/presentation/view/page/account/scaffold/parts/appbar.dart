import 'package:flutter/material.dart';
import 'package:bank/presentation/view/plug/callback.dart';

class AccountPageAppBar extends AppBar {
  AccountPageAppBar({Key? key})
      : super(
          key: key,
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            onPressed: plug,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.open_in_new),
              onPressed: plug,
            )
          ],
        );
}
