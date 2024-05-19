import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        toolbarHeight: 68,
        title: Text(
          'Login Page',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
