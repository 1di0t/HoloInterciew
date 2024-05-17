import 'package:flutter/material.dart';
import 'package:holo_interview/screens/interview_page.dart';

class SelectingCard extends StatelessWidget {
  const SelectingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InterViewPage()));
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(child: Image.asset('assets/images/quka.png')),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Text"),
                ),
              ],
            ),
          )),
    );
  }
}
