import 'package:flutter/material.dart';
import 'package:holo_interview/api/routing_page_api.dart';

class NavigatorCard extends StatelessWidget {
  final String company;
  final bool isFeedback;

  const NavigatorCard({
    super.key,
    required this.company,
    required this.isFeedback,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: const Color(0x00000000),
      hoverColor: const Color(0x00000000),
      highlightColor: const Color(0x00000000),
      onTap: () {
        //여기에 GPT에게 기본정보 전송
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => cardRouting(context, isFeedback)),
        );
      },
      child: Card(
        color: Theme.of(context).disabledColor,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cardTextGetter(company, isFeedback),
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Image.asset(
                'assets/images/interview.png',
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
