import 'package:flutter/material.dart';
import 'package:holo_interview/screens/home_page.dart';
import 'package:holo_interview/widget/moving_page_button_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        leading: const MovingPageButton(
          iconData: Icons.arrow_back,
          nextPage: HomePage(),
          isFocused: false,
          buttonDetailTexts: 'Back',
        ),
      ),
    );
  }
}
