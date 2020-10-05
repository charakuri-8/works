import 'package:flutter/material.dart';

// アイコンテキストラベル
Widget icontextLabel(IconData iconData, String title) {
  return Positioned(
    top: 0.0,
    child: Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.black87.withOpacity(0.8),
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

// ダイアログ
Future _showDialog(BuildContext context, String title) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        actions: <Widget>[
          FlatButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

//テンキーパッド
Widget tenkeyPad(String title, Color color) {
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

//テンキーパッド(アイコン)
Widget tenkeyPadIcon(
    String title, Color color, IconData iconData, model, context) {
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
        onPressed: () async {
          try {
            await model.addRecordToFirebase();
            await _showDialog(context, '成功しました');
            await model.fetchRecords();
          } catch (e) {
            await _showDialog(context, '失敗');
            await model.fetchRecords();
          }
        },
      ),
    ),
  );
}
