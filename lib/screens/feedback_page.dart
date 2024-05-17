import 'package:flutter/material.dart';
import '../widget/bottom_navigator_bar_widget.dart';

class FeedBackPage extends StatelessWidget {
  const FeedBackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
          ),
          Text(
            "피드백 페이지",
            style: TextStyle(
                fontFamily: 'NanumBarunpenB',
                fontSize: 30,
                color: Colors.black87),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigatorBar(
        firstButton: false,
        secondButton: false,
        thridButton: true,
      ),
    );
  }
}
