import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widget/bottom_navigator_bar_widget.dart';
import '../widget/combined_insert_info_widget.dart';
import '../widget/insert_info_widget.dart';
import '../api/network_api.dart';

class InsertInfoPage extends StatefulWidget {
  const InsertInfoPage({super.key});

  @override
  State<InsertInfoPage> createState() => _InsertInfoPageState();
}

class _InsertInfoPageState extends State<InsertInfoPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> sendingData = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final loggedIn = prefs.containsKey('userId');
    if (!loggedIn && mounted) {
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      CombinedInsertInfoWidget(
                        key: const ValueKey("workExperience"),
                        title: "업무 경력",
                        fields: [
                          InsertInfoWidget(
                            isRequired: false,
                            key: const ValueKey("companyName"),
                            dataName: "회사명",
                            onSaved: (value) {
                              sendingData["companyName"] = value!;
                              print('Saved companyName: $value'); // 디버깅 출력
                            },
                          ),
                          InsertInfoWidget(
                            isRequired: false,
                            key: const ValueKey("position"),
                            dataName: "직급",
                            onSaved: (value) {
                              sendingData["position"] = value!;
                              print('Saved position: $value'); // 디버깅 출력
                            },
                          ),
                          InsertInfoWidget(
                            isRequired: false,
                            key: const ValueKey("jobDetail"),
                            dataName: "업무 세부사항",
                            onSaved: (value) {
                              sendingData["jobDetail"] = value!;
                              print('Saved jobDetail: $value'); // 디버깅 출력
                            },
                          ),
                          InsertInfoWidget(
                            isRequired: false,
                            key: const ValueKey("years_of_service"),
                            dataName: "근무년수",
                            onSaved: (value) {
                              sendingData["years_of_service"] = value!;
                              print('Saved years_of_service: $value'); // 디버깅 출력
                            },
                          ),
                        ],
                      ),
                      CombinedInsertInfoWidget(
                        key: const ValueKey("education"),
                        title: "학력",
                        fields: [
                          InsertInfoWidget(
                            isRequired: false,
                            key: const ValueKey("schoolName"),
                            dataName: "학교명",
                            onSaved: (value) {
                              sendingData["schoolName"] = value!;
                              print('Saved schoolName: $value'); // 디버깅 출력
                            },
                          ),
                          InsertInfoWidget(
                            isRequired: false,
                            key: const ValueKey("major"),
                            dataName: "전공",
                            onSaved: (value) {
                              sendingData["major"] = value!;
                              print('Saved major: $value'); // 디버깅 출력
                            },
                          ),
                        ],
                      ),
                      CombinedInsertInfoWidget(
                        key: const ValueKey("projectExperience"),
                        title: "프로젝트 경험",
                        fields: [
                          InsertInfoWidget(
                            isRequired: false,
                            key: const ValueKey("devLanguage"),
                            dataName: "개발언어",
                            onSaved: (value) {
                              sendingData["devLanguage"] = value!;
                              print('Saved devLanguage: $value'); // 디버깅 출력
                            },
                          ),
                          InsertInfoWidget(
                            isRequired: false,
                            key: const ValueKey("tech"),
                            dataName: "기술",
                            onSaved: (value) {
                              sendingData["tech"] = value!;
                              print('Saved tech: $value'); // 디버깅 출력
                            },
                          ),
                          InsertInfoWidget(
                            isRequired: false,
                            key: const ValueKey("detail"),
                            dataName: "세부사항",
                            onSaved: (value) {
                              sendingData["detail"] = value!;
                              print('Saved detail: $value'); // 디버깅 출력
                            },
                          ),
                        ],
                      ),
                      CombinedInsertInfoWidget(
                        key: const ValueKey("applicationDetails"),
                        title: "지원 세부사항",
                        fields: [
                          InsertInfoWidget(
                            isRequired: true,
                            key: const ValueKey("company"),
                            dataName: "지원 회사명",
                            onSaved: (value) {
                              sendingData["company"] = value!;
                              print('Saved company: $value'); // 디버깅 출력
                            },
                          ),
                          InsertInfoWidget(
                            isRequired: true,
                            key: const ValueKey("industry"),
                            dataName: "회사 산업군",
                            onSaved: (value) {
                              sendingData["industry"] = value!;
                              print('Saved industry: $value'); // 디버깅 출력
                            },
                          ),
                          InsertInfoWidget(
                            isRequired: true,
                            key: const ValueKey("department"),
                            dataName: "부서",
                            onSaved: (value) {
                              sendingData["department"] = value!;
                              print('Saved department: $value'); // 디버깅 출력
                            },
                          ),
                          InsertInfoWidget(
                            isRequired: true,
                            key: const ValueKey("role"),
                            dataName: "직무",
                            onSaved: (value) {
                              sendingData["role"] = value!;
                              print('Saved role: $value'); // 디버깅 출력
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Theme.of(context).highlightColor,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              print('Sending data: $sendingData');
                              NetworkApi.submitUserInfo(context, sendingData);
                            }
                          },
                          child: const Text(
                            "저장",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
}
