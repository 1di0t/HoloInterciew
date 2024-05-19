import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:holo_interview/widget/bottom_navigator_bar_widget.dart';
import 'package:holo_interview/widget/combined_insert_info_widget.dart';
import 'package:holo_interview/widget/insert_info_widget.dart';

class InsertInfoPage extends StatefulWidget {
  const InsertInfoPage({super.key});

  @override
  State<InsertInfoPage> createState() => _InsertInfoPageState();
}

class _InsertInfoPageState extends State<InsertInfoPage> {
  final formKey = GlobalKey<FormState>();
  final Map<String, String> sendingData = {};

  void submitData() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('입력된 데이터: $sendingData'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
                height:
                    60), // Add this line to create space between the top of the screen and the title (정보 입력
            const Text(
              "정보 입력",
              style: TextStyle(
                  fontFamily: 'NanumBarunpenB',
                  fontSize: 30,
                  color: Colors.black87),
            ),
            Expanded(
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    //Education background section with 3 fields
                    CombinedInsertInfoWidget(title: "학력", fields: [
                      InsertInfoWidget(
                        dataName: "학교명",
                        onSaved: (value) {
                          sendingData["schoolName"] = value!;
                        },
                      ),
                      InsertInfoWidget(
                        dataName: "전공",
                        onSaved: (value) {
                          sendingData["major"] = value!;
                        },
                      ),
                      InsertInfoWidget(
                        dataName: "학년",
                        onSaved: (value) {
                          sendingData["grade"] = value!;
                        },
                      ),
                    ]),
                    //Work experience section with 4 fields
                    CombinedInsertInfoWidget(title: "업무 경력", fields: [
                      InsertInfoWidget(
                        dataName: "회사명",
                        onSaved: (value) {
                          sendingData["companyName"] = value!;
                        },
                      ),
                      InsertInfoWidget(
                        dataName: "직급",
                        onSaved: (value) {
                          sendingData["position"] = value!;
                        },
                      ),
                      InsertInfoWidget(
                        dataName: "업무 세부사항",
                        onSaved: (value) {
                          sendingData["jobDetial"] = value!;
                        },
                      ),
                      InsertInfoWidget(
                        dataName: "근무년수",
                        onSaved: (value) {
                          sendingData["years_of_service"] = value!;
                        },
                      ),
                    ]),
                    //Project experience section with 3 fields
                    CombinedInsertInfoWidget(title: "프로젝트 경험", fields: [
                      InsertInfoWidget(
                        dataName: "개발언어",
                        onSaved: (value) {
                          sendingData["devLanguage"] = value!;
                        },
                      ),
                      InsertInfoWidget(
                        dataName: "프레임워크",
                        onSaved: (value) {
                          sendingData["framework"] = value!;
                        },
                      ),
                      InsertInfoWidget(
                        dataName: "세부사항",
                        onSaved: (value) {
                          sendingData["detail"] = value!;
                        },
                      ),
                    ]),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 25),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context).highlightColor,
                        ),
                        onPressed: submitData,
                        child: Text("저장",
                            style: TextStyle(
                                fontFamily: 'NanumBarunpenB',
                                fontSize: 20,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigatorBar(
        firstButton: true,
        secondButton: false,
        thridButton: false,
      ),
    );
  }
}
