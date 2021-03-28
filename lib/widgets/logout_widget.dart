import 'package:flutter/material.dart';
import '../services/auth.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.logout),
        onPressed: () async {
          signout(context);
        });
  }
}
