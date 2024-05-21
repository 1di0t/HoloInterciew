import 'package:flutter/material.dart';

class NavigatorCard extends StatelessWidget {
  final String company;
  final Widget nextPage;

  const NavigatorCard({
    super.key,
    required this.company,
    required this.nextPage,
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
          MaterialPageRoute(builder: (context) => nextPage),
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
                '$company 면접 시작하기',
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
