import 'package:flutter/material.dart';
import '../widget/bottom_navigator_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
          ),
          Text("메인 페이지"),
        ],
      ),
      bottomNavigationBar: BottomNavigatorBar(
        firstButton: false,
        secondButton: true,
        thridButton: false,
      ),
    );
  }
}
