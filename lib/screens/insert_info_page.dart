import 'package:flutter/material.dart';
import 'package:holo_interview/widget/bottom_navigator_bar_widget.dart';

class InsertInfoPage extends StatelessWidget {
  const InsertInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
          ),
          Text("데이터 삽입 페이지")
        ],
      ),
      bottomNavigationBar: BottomNavigatorBar(
        firstButton: true,
        secondButton: false,
        thridButton: false,
      ),
    );
  }
}
