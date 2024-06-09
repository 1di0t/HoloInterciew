import 'package:flutter/material.dart';
import 'package:flutter_testproject/api/page_routing.dart';
import 'package:flutter_testproject/api/routing_page_api.dart';

class NavigatorCard extends StatelessWidget {
  final String company;
  final bool isFeedback;
  final int interviewSetId;

  const NavigatorCard({
    super.key,
    required this.company,
    required this.isFeedback,
    required this.interviewSetId,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: const Color(0x00000000),
      hoverColor: const Color(0x00000000),
      highlightColor: const Color(0x00000000),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => routingPage(isFeedback, interviewSetId),
          ),
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
