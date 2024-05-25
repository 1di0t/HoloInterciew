import 'package:flutter/material.dart';
import 'package:holo_interview/screens/feedback_page.dart';
import 'package:holo_interview/screens/interview_page.dart';

String cardTextGetter(String company, bool isFeedback) {
  return isFeedback ? "$company 피드백 보기" : "$company 면접 시작하기";
}

Widget cardRouting(BuildContext context, bool isFeedback) {
  return isFeedback ? const FeedBackPage() : const InterViewPage();
}
