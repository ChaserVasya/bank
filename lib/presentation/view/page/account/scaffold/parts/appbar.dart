import 'package:flutter/material.dart';
import 'package:bank/presentation/view/plug/callback.dart';

class AccountPageAppBar extends AppBar {
  AccountPageAppBar({Key? key})
      : super(
          key: key,
          leading: const IconButton(
            icon: Icon(Icons.keyboard_backspace),
            onPressed: plug,
          ),
          actions: [
            const IconButton(
              icon: Icon(Icons.open_in_new),
              onPressed: plug,
            )
          ],
        );
}
