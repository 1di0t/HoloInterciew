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
      padding: const EdgeInsets.all(5.0),
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          MovingPageButton(
            iconData: Icons.menu,
            nextPage: InsertInfoPage(),
            isFocused: firstButton,
            buttonDetailTexts: "입력",
          ),
          MovingPageButton(
            iconData: Icons.emoji_people_outlined,
            nextPage: const HomePage(),
            isFocused: secondButton,
            buttonDetailTexts: "홈",
          ),
          MovingPageButton(
            iconData: Icons.document_scanner_rounded,
            nextPage: const FeedBackPage(),
            isFocused: thridButton,
            buttonDetailTexts: "피드백",
          ),
        ],
      ),
    );
  }
}
