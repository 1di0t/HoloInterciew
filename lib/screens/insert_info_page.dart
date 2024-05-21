import 'package:flutter/material.dart';
import 'package:holo_interview/widget/bottom_navigator_bar_widget.dart';
import 'package:holo_interview/widget/combined_insert_info_widget.dart';
import 'package:holo_interview/widget/insert_info_widget.dart';
import '../api/network_api.dart';

class InsertInfoPage extends StatefulWidget {
  const InsertInfoPage({super.key});

  @override
  State<InsertInfoPage> createState() => _InsertInfoPageState();
}

class _InsertInfoPageState extends State<InsertInfoPage> {
  final _formKey =
      GlobalKey<FormState>(); //Form key that can access in this file
  final Map<String, String> sendingData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        //==================================================
        //default padding in page
        //==================================================
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            //==================================================
            //Title of the page
            //==================================================
            Text(
              "정보 입력",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            //==================================================
            //Form to input the data wraped in Expanded
            //==================================================
            Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    //==================================================
                    //Education background section with 3 fields
                    //==================================================
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
                    //==================================================
                    //Work experience section with 4 fields
                    //==================================================
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
                    //==================================================
                    //Project experience section with 3 fields
                    //==================================================
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
                    //==================================================
                    //Button to submit the form
                    //==================================================
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context).highlightColor,
                        ),
                        onPressed: () => submitData(
                            context, _formKey, sendingData), //Submit the data
                        child: Text("저장",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: Colors.white)),

                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      //==================================================
      //BottomNavigationBar
      //==================================================
      bottomNavigationBar: const BottomNavigatorBar(
        firstButton: true,
        secondButton: false,
        thridButton: false,
      ),
    );
  }
}
