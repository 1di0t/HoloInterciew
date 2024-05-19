import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:holo_interview/screens/interview_page.dart';
import 'package:holo_interview/screens/login_page.dart';
import 'package:holo_interview/widget/navigator_card.dart';
import '../widget/bottom_navigator_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            //==================================================
            //SizedBox to aviod the camera
            //==================================================
            const SizedBox(
              height: 60,
            ),
            //==================================================
            //Title of the page
            //==================================================
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "메인 페이지",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  //==================================================
                  //IconButton to navigate to the login page
                  //==================================================
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      icon: Icon(
                        Icons.insert_emoticon_rounded,
                        size: 40,
                        color: Theme.of(context).disabledColor,
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //==================================================
            //NavigatorCard to navigate to the interview page
            //==================================================
            const NavigatorCard(
                texts: '네이버 면접 시작하기',
                nextPage: InterViewPage(),
                imageUrl: "assets/images/quka.png"),
          ],
        ),
      ),
      //==================================================
      //BottomNavigationBar
      //==================================================
      bottomNavigationBar: const BottomNavigatorBar(
        firstButton: false,
        secondButton: true,
        thridButton: false,
      ),
    );
  }
}
