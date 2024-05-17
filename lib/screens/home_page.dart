import 'package:flutter/material.dart';
import 'package:holo_interview/screens/login_page.dart';
import 'package:holo_interview/widget/moving_page_button_widget.dart';
import '../widget/bottom_navigator_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "메인 페이지",
                  style: TextStyle(
                      fontFamily: 'NanumBarunpenB',
                      fontSize: 30,
                      color: Colors.black87),
                ),
                MovingPageButton(
                  iconData: Icons.insert_emoticon_rounded,
                  nextPage: LoginPage(),
                  isFocused: true,
                  buttonDetailTexts: "",
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigatorBar(
        firstButton: false,
        secondButton: true,
        thridButton: false,
      ),
    );
  }
}
