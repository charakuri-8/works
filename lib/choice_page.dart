import 'package:flutter/material.dart';
import 'package:works/multi/home_page.dart';

class ChoicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MultiHomePage(),
                    fullscreenDialog: true,
                  ),
                );
              },
              color: Colors.lightBlueAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.tablet,
                    size: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'みんなのモード',
                      style: TextStyle(
                        fontSize: 36.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {},
              color: Colors.greenAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.smartphone,
                    size: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'ひとりのモード',
                      style: TextStyle(
                        fontSize: 36.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
