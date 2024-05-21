import 'package:flutter/material.dart';
import 'package:holo_interview/screens/feedback_page.dart';
import 'package:holo_interview/screens/home_page.dart';
import 'package:holo_interview/screens/insert_info_page.dart';
import 'package:holo_interview/widget/moving_page_button_widget.dart';

class BottomNavigatorBar extends StatelessWidget {
  final bool firstButton, secondButton, thridButton;
  const BottomNavigatorBar({
    super.key,
    required this.firstButton,
    required this.secondButton,
    required this.thridButton,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 88,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          MovingPageButton(
            iconData: Icons.assignment_add,
            nextPage: const InsertInfoPage(),
            isFocused: firstButton,
            buttonDetailTexts: "입력",
          ),
          MovingPageButton(
            iconData: Icons.other_houses_rounded,
            nextPage: const HomePage(),
            isFocused: secondButton,
            buttonDetailTexts: "홈",
          ),
          MovingPageButton(
            iconData: Icons.mark_unread_chat_alt_rounded,
            nextPage: const FeedBackPage(),
            isFocused: thridButton,
            buttonDetailTexts: "피드백",
          ),
        ],
      ),
    );
  }
}
