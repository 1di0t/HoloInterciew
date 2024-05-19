import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:holo_interview/screens/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xff70ae6e),
        scaffoldBackgroundColor: const Color(0xfff7f5fb),
        highlightColor: const Color(0xff315c2b),
        disabledColor: const Color(0xff6c6f7f),
        focusColor: const Color(0xffff8811),
        textTheme: const TextTheme(
            displayLarge: TextStyle(
                fontFamily: 'NanumBarunpenB',
                fontSize: 40,
                color: Colors.black87),
            displayMedium: TextStyle(
                fontFamily: 'NanumBarunpenB',
                fontSize: 25,
                color: Colors.black87),
            displaySmall: TextStyle(
                fontFamily: 'NanumBarunpenB',
                fontSize: 10,
                color: Colors.black87)),
      ),
      home: const HomePage(),
    );
  }
}
