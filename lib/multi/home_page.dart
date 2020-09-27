import 'package:flutter/material.dart';
import 'package:works/multi/account_page.dart';
import 'package:works/multi/clock_model.dart';

class MultiHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = [
      '09/27 (日) 11:09 島村 裕太 出勤',
      '09/27 (日) 11:09 島村 裕太 出勤',
    ];
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
                            ListView.builder(
                              itemBuilder: (BuildContext context, int index) {
                                if (index >= list.length) {
                                  list.addAll([
                                    '09/27 (日) 11:09 島村 裕太 出勤',
                                    '09/27 (日) 11:09 島村 裕太 出勤',
                                  ]);
                                }
                                return Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 1.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  child: ListTile(
                                    title: Text(list[index]),
                                  ),
                                );
                              },
                            ),
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
                  color: Colors.black12,
                  child: Stack(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(Icons.lens),
                                Icon(Icons.lens),
                                Icon(Icons.lens),
                                Icon(Icons.lens),
                                Icon(Icons.lens),
                                Icon(Icons.lens),
                                Icon(Icons.lens),
                                Icon(Icons.lens),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      _tenkeyPad(
                                        '7',
                                        Colors.white,
                                      ),
                                      _tenkeyPad(
                                        '4',
                                        Colors.white,
                                      ),
                                      _tenkeyPad(
                                        '1',
                                        Colors.white,
                                      ),
                                      _tenkeyPad(
                                        '',
                                        Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      _tenkeyPad(
                                        '8',
                                        Colors.white,
                                      ),
                                      _tenkeyPad(
                                        '5',
                                        Colors.white,
                                      ),
                                      _tenkeyPad(
                                        '2',
                                        Colors.white,
                                      ),
                                      _tenkeyPad(
                                        '0',
                                        Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      _tenkeyPad(
                                        '9',
                                        Colors.white,
                                      ),
                                      _tenkeyPad(
                                        '6',
                                        Colors.white,
                                      ),
                                      _tenkeyPad(
                                        '3',
                                        Colors.white,
                                      ),
                                      _tenkeyPad(
                                        '',
                                        Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      _tenkeyPadIcon(
                                        '訂正',
                                        Colors.redAccent,
                                        Icons.backspace,
                                      ),
                                      _tenkeyPadIcon(
                                        '決定',
                                        Colors.blueAccent,
                                        Icons.keyboard_return,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
        color: Colors.black,
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

// テンキーパッド作成
Widget _tenkeyPad(String title, Color color) {
  return Expanded(
    child: SizedBox.expand(
      child: RaisedButton(
        color: color,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 60.0,
          ),
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        onPressed: () {},
      ),
    ),
  );
}

// テンキーパッド(アイコン)作成
Widget _tenkeyPadIcon(String title, Color color, IconData iconData) {
  return Expanded(
    child: SizedBox.expand(
      child: RaisedButton(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              iconData,
              size: 60.0,
              color: Colors.white,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        onPressed: () {},
      ),
    ),
  );
}
