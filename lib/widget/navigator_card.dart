import 'package:flutter/material.dart';

class NavigatorCard extends StatelessWidget {
  final String texts;
  final String imageUrl;
  final Widget nextPage;

  const NavigatorCard(
      {super.key,
      required this.texts,
      required this.nextPage,
      required this.imageUrl});

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
                texts,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Image.asset(
                imageUrl,
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
