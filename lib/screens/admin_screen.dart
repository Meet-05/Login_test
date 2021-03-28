import 'package:flutter/material.dart';

import '../services/auth.dart';
import '../widgets/logout_widget.dart';

class AdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hey Admin'),
        actions: [LogoutWidget()],
      ),
    );
  }
}
