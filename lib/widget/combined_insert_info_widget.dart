import 'package:flutter/material.dart';

class CombinedInsertInfoWidget extends StatelessWidget {
  final String title;
  final List<Widget> fields;

  const CombinedInsertInfoWidget(
      {super.key, required this.title, required this.fields});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  fontFamily: 'NanumBarunpenB',
                  fontSize: 20,
                  color: Theme.of(context).highlightColor)),
          ...fields
        ],
      ),
    );
  }
}
