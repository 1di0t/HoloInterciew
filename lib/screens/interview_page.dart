import 'dart:convert';
import 'package:holo_interview/constants.dart';
import 'package:flutter/material.dart';
import 'package:holo_interview/widget/chat_box_widget.dart';
import 'package:http/http.dart' as http;

class InterViewPage extends StatefulWidget {
  const InterViewPage({super.key});

  @override
  State<InterViewPage> createState() => _InterViewPageState();
}

class _InterViewPageState extends State<InterViewPage> {
  final flaskServer = Constants.flaskServer;
  final List<Map<String, dynamic>> messages = [];
  final TextEditingController textController = TextEditingController();
  @override
  void initState() {
    super.initState();
    setUser();
  }

  Future<void> setUser() async {
    //The function to set base infomation start the chat
    final response = await http.post(Uri.parse(
        '$flaskServer/api/set')); //Call the Post Method from the Flask server
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
    if (textController.text.isNotEmpty && textController.text != "") {
      //그냥 엔터만 누르는 것을 방지하는게 안됨
      messages.add({'texts': textController.text, 'isUser': true});
      final response = await http.post(
        Uri.parse('$flaskServer/api/gpt'),
        //Call the Post Method from the Flask server
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'message': textController.text,
        }),
      );

      if (response.statusCode == 200) {
        setState(() {
          final Map<String, dynamic> responsedata = jsonDecode(response.body);
          if (responsedata['message'] == "수고하셨습니다") {
            messages.add(
                {'texts': "수고하셨습니다\n면접이 종료되었습니다\n3초 후 종료됩니다", 'isUser': false});
            Future.delayed(const Duration(seconds: 3), () {
              Navigator.pop(context);
            });
          } else {
            messages.add({'texts': responsedata['message'], 'isUser': false});
          }
        });
      } else {
        setState(() {
          messages.add({'texts': "서버와의 연결이 끊겼습니다", 'isUser': false});
        });
      }
    }
  }

  void _listen() async {}
  // Future<void> receiveMessage() async {
  //   //The function to receive the message from the flask server
  //   final response = await http.get(Uri.parse(
  //       '$flaskServer/api/gpt')); //Call the Get Method from the Flask server
  //   if (response.statusCode == 200) {
  //     //if the response is alright
  //     Future.delayed(const Duration(seconds: 1), () {
  //       //Delay the response for 700 milliseconds
  //       setState(() {
  //         final Map<String, dynamic> data = jsonDecode(response.body);
  //         String receivedMessage = data['message'];
  //         if (receivedMessage.isEmpty) {
  //           messages.add({'texts': "면접이 종료되었습니다\n3초 후 종료됩니다", 'isUser': false});
  //           Future.delayed(const Duration(seconds: 3), () {
  //             Navigator.pop(context);
  //           });
  //         } else if (receivedMessage.isNotEmpty) {
  //           messages.add({'texts': receivedMessage, 'isUser': false});
  //         }
  //       });
  //     });
  //   }
  // }

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
                    textController.clear();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.mic_rounded),
                  onPressed: () {
                    _listen();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
