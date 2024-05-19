import 'package:flutter/material.dart';
import 'package:holo_interview/widget/chat_box_widget.dart';

class InterViewPage extends StatefulWidget {
  const InterViewPage({super.key});

  @override
  State<InterViewPage> createState() => _InterViewPageState();
}

class _InterViewPageState extends State<InterViewPage> {
  final List<Map<String, dynamic>> messages = [];
  final TextEditingController textController = TextEditingController();

  void sendMessage() {
    if (textController.text.isNotEmpty) {
      setState(() {
        messages.add({'texts': textController.text, 'isUser': true});
        textController.clear();
      });
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          messages.add(
              {'texts': 'I said ${messages.last['texts']}', 'isUser': false});
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
            padding: const EdgeInsets.all(10),
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
                  onPressed: sendMessage,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
