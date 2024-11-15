import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:holo_interview/widget/chat_box_widget.dart';
import 'package:http/http.dart' as http;
import 'package:holo_interview/constants.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({super.key});

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  final List<Map<String, dynamic>> messages = [];
  final List<String> questions = [];
  final List<String> answers = [];
  final List<String> feedback = [];
  final flaskServer = Constants.flaskServer;
  var isended = false;

  Future<void> receiveMessage() async {
    //The function to receive the message from the flask server
    final response = await http.get(Uri.parse('$flaskServer/api/database'));
    //Call the Get Method from the Flask server
    if (response.statusCode == 200) {
      //if the response is alright
      Future.delayed(const Duration(milliseconds: 700), () {
        //Delay the response for 700 milliseconds
        setState(() {
          final Map<String, dynamic> data = jsonDecode(response.body);
          if (data.isNotEmpty) {
            for (var values in data.values) {
              messages.add({'texts': values, 'isUser': false});
            }
          } else {
            isended = true;
          }
        });
      });
    }
  }

  void displayMessage() {
    messages.add({'texts': '안녕하세요! 저는 GPT-3입니다. 무엇을 도와드릴까요?', 'isUser': false});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return ChatBox(
                        texts: messages[index]['texts'],
                        isUser: messages[index]['isUser']);
                  })),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 150,
                  child: TextButton(
                    onPressed: !isended ? receiveMessage : null,
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).highlightColor,
                      padding: const EdgeInsets.all(16.0),
                    ),
                    child: const Text('메세지 받기'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
