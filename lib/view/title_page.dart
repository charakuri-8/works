import 'package:flutter/material.dart';
import 'package:works/view/choice_page.dart';

class TitlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'WORKS',
                  style: TextStyle(
                    fontSize: 54.0,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'タップしてスタート',
                  style: TextStyle(
                    fontSize: 32.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ChoicePage()),
          );
        },
      ),
    );
  }
}
