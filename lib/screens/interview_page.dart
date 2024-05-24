import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:holo_interview/widget/chat_box_widget.dart';
import 'package:http/http.dart' as http;

class InterViewPage extends StatefulWidget {
  const InterViewPage({super.key});

  @override
  State<InterViewPage> createState() => _InterViewPageState();
}

class _InterViewPageState extends State<InterViewPage> {
  @override
  void initState() {
    super.initState();
    setUser();
  }

  final List<Map<String, dynamic>> messages = [];
  final TextEditingController textController = TextEditingController();

  Future<void> setUser() async {
    //The function to set base infomation start the chat
    final response = await http.post(Uri.parse(
        'http://127.0.0.1:5000/api/users')); //Call the Post Method from the Flask server
    try {
      if (response.statusCode == 200) {
        setState(() {
          final Map<String, dynamic> data = jsonDecode(response.body);
          String message = data['message'];
          if (response.statusCode == 200) {
            messages.add({'texts': message, 'isUser': false});
          }
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> sendMessage() async {
    if (textController.text.isNotEmpty) {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:5000/api/data'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'data': textController.text,
        }),
      );

      if (response.statusCode == 200) {
        setState(() {
          messages.add({'texts': textController.text, 'isUser': true});
          textController.clear();
        });
      }
    }
  }

  Future<void> receiveMessage() async {
    //The function to receive the message from the flask server
    final response = await http.get(Uri.parse(
        'http://127.0.0.1:5000/api/data')); //Call the Get Method from the Flask server
    if (response.statusCode == 200) {
      //if the response is alright
      Future.delayed(const Duration(seconds: 1), () {
        //Delay the response for 700 milliseconds
        setState(() {
          final Map<String, dynamic> data = jsonDecode(response.body);
          String receivedMessage = data['message'];
          if (receivedMessage.isNotEmpty) {
            messages.add({'texts': receivedMessage, 'isUser': false});
          } else {
            messages.add({'texts': "면접이 종료되었습니다\n3초 후 종료됩니다", 'isUser': false});
            Future.delayed(const Duration(seconds: 3), () {
              Navigator.pop(context);
            });
          }
        });
      });
    }
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
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: "메세지를 입력하세요",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send_rounded),
                  onPressed: () {
                    sendMessage();
                    receiveMessage();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
