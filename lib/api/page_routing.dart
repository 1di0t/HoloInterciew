import 'package:flutter/material.dart';
import 'package:holo_interview/screens/login_page.dart';
import 'package:holo_interview/screens/interview_page.dart';

Widget routingPage(bool isFeedback) {
  //will add interviewId
  return isFeedback ? const LoginPage() : const InterViewPage();
}
