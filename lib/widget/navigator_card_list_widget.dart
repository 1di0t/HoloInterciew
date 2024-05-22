import 'package:flutter/material.dart';
import 'package:holo_interview/widget/navigator_card.dart';

class NavigatorCardList extends StatelessWidget {
  final List<Map<String, dynamic>> interviewList = [
    //Get Data in database
    {"company": "Naver", "interviewId": 1},
    {"company": "Kakao", "interviewId": 2},
    {"company": "Samsung", "interviewId": 3},
    {"company": "Apple", "interviewId": 4},
    {"company": "Facebook", "interviewId": 5},
    {"company": "Google", "interviewId": 6},
    {"company": "Coupang", "interviewId": 7}
  ];
  final bool isFeedback;

  NavigatorCardList({super.key, required this.isFeedback});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: interviewList.length,
        itemBuilder: (context, index) {
          return NavigatorCard(
            company: interviewList[index]["company"],
            isFeedback: isFeedback,
          );
        },
      ),
    );
  }
}
