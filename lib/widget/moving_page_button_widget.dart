import 'package:flutter/material.dart';
import 'package:holo_interview/api/icon_highlighter.dart';

class MovingPageButton extends StatelessWidget {
  final IconData iconData;
  final Widget nextPage;
  final bool isFocused;
  const MovingPageButton({
    super.key,
    required this.iconData,
    required this.nextPage,
    required this.isFocused,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(
          iconData,
          size: 45,
          color: setColor(isFocused),
        ),
        onPressed: () {
          Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => nextPage,
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero));
        });
  }
}
