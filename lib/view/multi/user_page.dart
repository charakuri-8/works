import 'package:flutter/material.dart';
import 'package:works/database_helper.dart';

class UserPageM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sqflite example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              color: Colors.grey,
              child: Text('insert'),
              onPressed: () async {
                int i = await DatabaseHelper.instance.insert({
                  DatabaseHelper.columnName: 'ROCKMANEXE',
                });

                print('the inserted id is $i');
              },
            ),
            FlatButton(
              color: Colors.green,
              child: Text('query'),
              onPressed: () async {
                List<Map<String, dynamic>> queryRows =
                    await DatabaseHelper.instance.queryAll();
                print(queryRows);
              },
            ),
            FlatButton(
              color: Colors.blue,
              child: Text('update'),
              onPressed: () async {
                int updatedId = await DatabaseHelper.instance.update({
                  DatabaseHelper.columnId: 1,
                  DatabaseHelper.columnName: 'WORKMAN',
                });
                print(updatedId);
              },
            ),
            FlatButton(
              color: Colors.red,
              child: Text('delete'),
              onPressed: () async {
                int rowsEffected = await DatabaseHelper.instance.delete(1);
              },
            ),
          ],
        ),
      ),
    );
  }
}
