import 'package:flutter/material.dart';
import 'package:flutter_testproject/screens/login_page.dart';
import '../widget/bottom_navigator_bar_widget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_testproject/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_testproject/screens/interview_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> interviewSets = [];

  @override
  void initState() {
    super.initState();
    fetchInterviewSets();
  }

  Future<void> fetchInterviewSets() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId') ?? '';

    if (userId.isNotEmpty) {
      final response = await http.get(
        Uri.parse(
            '${Constants.flaskServer}/api/get_interview_sets?userId=$userId'),
      );

      if (response.statusCode == 200) {
        setState(() {
          interviewSets =
              List<Map<String, dynamic>>.from(jsonDecode(response.body));
        });
      } else {
        print('Failed to fetch interview sets: ${response.body}');
      }
    } else {
      print('UserId is not set in SharedPreferences');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "메인 페이지",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    icon: Image.asset(
                      "assets/images/holoInterview.png",
                      width: const Size.fromWidth(60).width,
                      height: const Size.fromHeight(60).height,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: interviewSets.length,
                itemBuilder: (context, index) {
                  final interviewSet = interviewSets[index];
                  return Card(
                    child: ListTile(
                      title: Text('${interviewSet['company']} 면접 시작하기'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InterViewPage(
                                  interviewSetId:
                                      interviewSet['interviewSetId']),
                            ),
                          );
                        },
                        child: Text('면접 시작하기'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigatorBar(
        firstButton: false,
        secondButton: true,
        thridButton: false,
      ),
    );
  }
}
