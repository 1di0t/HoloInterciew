import 'package:flutter/material.dart';

class CombinedInsertInfoWidget extends StatelessWidget {
  final String title;
  final List<Widget> fields;

  const CombinedInsertInfoWidget(
      {super.key, required this.title, required this.fields});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.displayMedium),
        ...fields
      ],
    );
  }
}
