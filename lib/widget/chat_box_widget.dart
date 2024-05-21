//====================================================================
//ChatBoxWidget is a widget that displays a chat box with a text field
//====================================================================
import 'package:flutter/material.dart';

class ChatBox extends StatelessWidget {
  final String texts;
  final bool isUser;

  const ChatBox({super.key, required this.texts, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: isUser
              ? Theme.of(context).highlightColor
              : Theme.of(context).focusColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          texts,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Theme.of(context).scaffoldBackgroundColor),
        ),
      ),
    );
  }
}
