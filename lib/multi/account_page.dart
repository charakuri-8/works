import 'package:flutter/material.dart';

class MultiAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          icon: Icon(
            Icons.close,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
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
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 8.0,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'メールアドレス',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return null;
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'パスワード',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return null;
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                color: Colors.blue,
                child: Text('ログイン'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
