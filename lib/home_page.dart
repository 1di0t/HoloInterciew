import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SizedBox(
        height: 50,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.emoji_people_outlined,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.document_scanner_rounded,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
