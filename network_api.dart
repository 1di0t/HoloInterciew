import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkApi {
  static const String baseUrl =
      'http://127.0.0.1:5000/api'; // Flask 서버의 IP 주소로 변경

  // Function to register the user
  static Future<void> registerUser(
      BuildContext context, Map<String, String> registerData) async {
    final String url = '$baseUrl/register';
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(registerData),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User registered successfully')));
      // 회원가입 성공 후 로그인 페이지로 이동
      Navigator.pop(context);
    } else {
      print('Failed to register user: ${response.body}');
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to register user')));
    }
  }

  // Function to login the user
  static Future<void> loginUser(
      BuildContext context, Map<String, String> loginData) async {
    final String url = '$baseUrl/login';
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(loginData),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final userID = responseData['userID'];
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login successful')));
      // 로그인 성공 후 메인 페이지로 이동
      Navigator.pushReplacementNamed(context, '/home', arguments: userID);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Invalid credentials')));
    }
  }

  // Function to submit user information
  static Future<void> submitUserInfo(
      BuildContext context, Map<String, String> userInfo) async {
    final String url = '$baseUrl/submit_info';
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userInfo),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Information submitted successfully')));
    } else {
      print('Failed to submit information: ${response.body}');
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to submit information')));
    }
  }
}
