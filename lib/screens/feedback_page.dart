import 'package:flutter/material.dart';
import 'package:holo_interview/widget/chat_box_widget.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({super.key});

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  final List<Map<String, dynamic>> messages = [];

  void receiveMessage() {
    Future.delayed(const Duration(milliseconds: 700), () {
      setState(() {
        //getMessage
        String receiveMessage = 'Hello';
        messages.add({'texts': 'I said $receiveMessage', 'isUser': false});
      });
    });
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
                    onPressed: receiveMessage,
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
