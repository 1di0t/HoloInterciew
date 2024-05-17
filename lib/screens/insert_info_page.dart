import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:holo_interview/widget/bottom_navigator_bar_widget.dart';
import 'package:holo_interview/widget/insert_info_widget.dart';

class InsertInfoPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  InsertInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          Form(
              key: key,
              child: Column(
                children: <Widget>[
                  const InsertInfoWidget(title: "회사명"),
                  const InsertInfoWidget(title: "회사분류"),
                  const InsertInfoWidget(title: "회사부서"),
                  const InsertInfoWidget(title: "경력"),
                  const InsertInfoWidget(title: "프로젝트 경험"),
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          //Save Into Server
                        }
                      },
                      child: const Text("저장"))
                ],
              ))
        ],
      ),
      bottomNavigationBar: const BottomNavigatorBar(
        firstButton: true,
        secondButton: false,
        thridButton: false,
      ),
    );
  }
}
