import 'package:flutter/material.dart';
import 'package:holo_interview/api/network_api.dart';
import 'package:holo_interview/screens/signup_page.dart';
import '../widget/insert_info_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> loginData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          toolbarHeight: 68,
          title: Text(
            'Login',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                InsertInfoWidget(
                  dataName: "아이디",
                  onSaved: (value) {
                    loginData["userID"] = value!;
                  },
                ),
                InsertInfoWidget(
                  dataName: "비밀번호",
                  onSaved: (value) {
                    loginData["password"] = value!;
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).highlightColor,
                      padding: const EdgeInsets.all(16.0),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        registerUser(context, loginData);
                      }
                    }, //Submit the data
                    child: Text("로그인",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).highlightColor,
                      padding: const EdgeInsets.all(16.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()));
                    }, //Submit the data
                    child: Text("회원가입",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
