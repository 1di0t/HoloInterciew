import 'package:flutter/material.dart';

Color setColor(bool isFocused, BuildContext context) {
  //Return the first color when it is focused
  return isFocused
      ? Theme.of(context).focusColor
      : Theme.of(context).disabledColor;
}
