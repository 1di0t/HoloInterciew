import 'package:flutter/material.dart';
import 'package:holo_interview/screens/interview_page.dart';
import 'package:holo_interview/widget/navigator_card.dart';
import '../widget/bottom_navigator_bar_widget.dart';

//==================================================
//Feedback page
//==================================================
class FeedBackPage extends StatelessWidget {
  const FeedBackPage({super.key});

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "피드백 페이지",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
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
              company: '네이버',
              nextPage: InterViewPage(),
            ),
          ],
        ),
      ),
      //==================================================
      //BottomNavigationBar
      //==================================================
      bottomNavigationBar: const BottomNavigatorBar(
        firstButton: false,
        secondButton: false,
        thridButton: true,
      ),
    );
  }
}
