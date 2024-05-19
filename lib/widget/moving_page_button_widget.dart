import 'package:flutter/material.dart';
import 'package:holo_interview/api/icon_highlighter.dart';

class MovingPageButton extends StatelessWidget {
  final IconData iconData;
  final Widget nextPage;
  final bool isFocused;
  final String buttonDetailTexts;
  const MovingPageButton({
    super.key,
    required this.iconData,
    required this.nextPage,
    required this.isFocused,
    required this.buttonDetailTexts,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              iconData,
              size: 45,
              color: setColor(isFocused, context),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  // pageBuilder is used to remove the transition animation and delete the previous page
                  PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          nextPage,
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero));
            }),
        Text(buttonDetailTexts,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: setColor(isFocused, context),
                fontWeight: FontWeight.bold,
                fontSize: 15))
      ],
    );
  }
}
