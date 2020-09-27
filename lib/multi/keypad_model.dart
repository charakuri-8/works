import 'package:flutter/material.dart';

class KeyPadModel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KeyPadModelState();
  }
}

class _KeyPadModelState extends State<KeyPadModel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                Icons.lens,
                color: Colors.black12,
              ),
              Icon(
                Icons.lens,
                color: Colors.black12,
              ),
              Icon(
                Icons.lens,
                color: Colors.black12,
              ),
              Icon(
                Icons.lens,
                color: Colors.black12,
              ),
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
                      '1',
                      Colors.white,
                    ),
                    _tenkeyPad(
                      '4',
                      Colors.white,
                    ),
                    _tenkeyPad(
                      '7',
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
                      '2',
                      Colors.white,
                    ),
                    _tenkeyPad(
                      '5',
                      Colors.white,
                    ),
                    _tenkeyPad(
                      '8',
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
                      '3',
                      Colors.white,
                    ),
                    _tenkeyPad(
                      '6',
                      Colors.white,
                    ),
                    _tenkeyPad(
                      '9',
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
    );
  }
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
