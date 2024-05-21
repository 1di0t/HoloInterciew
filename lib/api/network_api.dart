import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//==================================================
//Function to submit the data
//==================================================
void submitData(BuildContext context, GlobalKey<FormState> formKey,
    Map<String, String> sendingData) {
  if (formKey.currentState!.validate()) {
    formKey.currentState!.save();
    var jsonsendingData = jsonEncode(sendingData);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('입력된 데이터: $jsonsendingData\n'),
      ),
    );
  }
}

//==================================================
//Function to register the user
//==================================================
Future<void> registerUser(
    //change to return bool
    BuildContext context,
    Map<String, String> loginData) async {
  const String flaskURL = '';
  final response = await http.post(
    Uri.parse(flaskURL), // Flask 서버의 IP 주소로 변경
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(loginData),
  );

  if (response.statusCode == 200) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User registered successfully')));
  } else {
    print('Failed to register user: ${response.body}');
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Failed to register user')));
  }
}
