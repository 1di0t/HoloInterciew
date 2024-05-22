import 'package:flutter/material.dart';
import 'package:holo_interview/api/network_api.dart';
import '../widget/insert_info_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> signUpData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          toolbarHeight: 68,
          title: Text(
            'Login Page',
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
                    signUpData["userID"] = value!;
                  },
                ),
                InsertInfoWidget(
                  dataName: "비밀번호",
                  onSaved: (value) {
                    signUpData["password"] = value!;
                  },
                ),
                InsertInfoWidget(
                  dataName: "이름",
                  onSaved: (value) {
                    signUpData["userName"] = value!;
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
                        submitData(context, _formKey, signUpData);
                      }
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
