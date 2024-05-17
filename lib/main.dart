import 'package:flutter/material.dart';
import 'package:holo_interview/screens/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: const Color(0xff6c6f7f),
          scaffoldBackgroundColor: const Color(0xfff7f5fb)),
      home: const HomePage(),
    );
  }
}
