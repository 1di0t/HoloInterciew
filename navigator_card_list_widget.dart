import 'package:flutter/material.dart';
import 'package:flutter_testproject/api/network_api.dart';
import 'package:flutter_testproject/widget/navigator_card.dart';

class NavigatorCardList extends StatefulWidget {
  final bool isFeedback;

  const NavigatorCardList({super.key, required this.isFeedback});

  @override
  _NavigatorCardListState createState() => _NavigatorCardListState();
}

class _NavigatorCardListState extends State<NavigatorCardList> {
  late Future<List<Map<String, dynamic>>> interviewSets;

  @override
  void initState() {
    super.initState();
    interviewSets = NetworkApi.fetchInterviewSets();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: interviewSets,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
              child: Text('Failed to load interview sets: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No interview sets available.'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final interviewSet = snapshot.data![index];
              return NavigatorCard(
                company: interviewSet['company'],
                isFeedback: widget.isFeedback,
                interviewSetId: interviewSet['interviewSetId'],
              );
            },
          );
        }
      },
    );
  }
}
