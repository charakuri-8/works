import 'package:flutter/material.dart';
import 'package:works/multi/account_page.dart';
import 'package:works/multi/clock_model.dart';
import 'package:works/multi/history_model.dart';
import 'package:works/multi/keypad_model.dart';

class MultiHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: <Widget>[
            Icon(
              Icons.timer,
              color: Colors.black,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'WORKS',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MultiAccountPage(),
                  fullscreenDialog: true,
                ),
              );
            },
            icon: Icon(
              Icons.account_circle_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // 左ウィジェット
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      width: double.infinity,
                      child: Card(
                        elevation: 5.0,
                        child: Stack(
                          children: <Widget>[
                            ClockModel(),
                            _iconLabel(
                              Icons.access_time,
                              '現在の時刻',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      width: double.infinity,
                      child: Card(
                        elevation: 5.0,
                        child: Stack(
                          children: <Widget>[
                            HistoryModel(),
                            _iconLabel(
                              Icons.list,
                              '打刻の履歴',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // 右ウィジェット
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  elevation: 5.0,
                  color: Colors.black54,
                  child: Stack(
                    children: <Widget>[
                      KeyPadModel(),
                      _iconLabel(
                        Icons.dialpad,
                        '社員番号の入力',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// アイコンラベル作成
Widget _iconLabel(IconData iconData, String title) {
  return Positioned(
    top: 0.0,
    child: Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5.0),
          bottomRight: Radius.circular(5.0),
        ),
      ),
      child: Row(
        children: <Widget>[
          Icon(
            iconData,
            color: Colors.white,
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                letterSpacing: 1.0,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
