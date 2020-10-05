import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:works/common.dart';
import 'package:works/view/multi/home_model.dart';
import 'package:works/view/multi/user_page.dart';

class HomePageM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClockModel>(
          create: (_) => ClockModel()..startDateTime(),
        ),
        ChangeNotifierProvider<RecordModel>(
          create: (_) => RecordModel()..fetchRecords(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          elevation: 3.0,
          backgroundColor: Colors.white,
          title: Row(
            children: <Widget>[
              Icon(
                Icons.timer,
                color: Colors.black87,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'WORKS',
                  style: TextStyle(
                    color: Colors.black87,
                    letterSpacing: 3.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.account_circle,
                color: Colors.black87,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('aa'),
                      content: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(),
                          ),
                        ],
                      ),
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
              },
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.black87,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserPageM(),
                    fullscreenDialog: true,
                  ),
                );
              },
            ),
          ],
        ),
        body: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
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
                          elevation: 3.0,
                          child: Stack(
                            children: <Widget>[
                              Consumer<ClockModel>(
                                builder: (context, model, child) {
                                  return Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          model.date,
                                          style: TextStyle(
                                            fontSize: 38.0,
                                            color: Colors.black,
                                            letterSpacing: 2.0,
                                          ),
                                        ),
                                        Text(
                                          model.time,
                                          style: TextStyle(
                                            fontSize: 62.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            letterSpacing: 6.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              icontextLabel(Icons.access_time, '現在の時刻'),
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
                          elevation: 3.0,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.only(
                                  top: 45.0,
                                ),
                                child: Consumer<RecordModel>(
                                  builder: (context, model, child) {
                                    final records = model.records;
                                    final listTiles = records
                                        .map(
                                          (record) => ListTile(
                                            leading: Chip(
                                              backgroundColor: Colors.blue,
                                              avatar: CircleAvatar(
                                                backgroundColor: Colors.white,
                                                child: Icon(
                                                  Icons.directions_run,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              label: Text(
                                                '出勤',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            title: Text(record.datetime),
                                            trailing: Text('島村 裕太'),
                                            onLongPress: () {},
                                          ),
                                        )
                                        .toList();
                                    return ListView(
                                      children: listTiles,
                                    );
                                  },
                                ),
                              ),
                              icontextLabel(Icons.list, '打刻の履歴'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    elevation: 5.0,
                    child: Stack(
                      children: <Widget>[
                        Consumer<RecordModel>(
                          builder: (context, model, child) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            tenkeyPad('1', Colors.white),
                                            tenkeyPad('4', Colors.white),
                                            tenkeyPad('7', Colors.white),
                                            tenkeyPad('', Colors.white),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            tenkeyPad('2', Colors.white),
                                            tenkeyPad('5', Colors.white),
                                            tenkeyPad('8', Colors.white),
                                            tenkeyPad('0', Colors.white),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            tenkeyPad('3', Colors.white),
                                            tenkeyPad('6', Colors.white),
                                            tenkeyPad('9', Colors.white),
                                            tenkeyPad('', Colors.white),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            tenkeyPadIcon(
                                              '訂正',
                                              Colors.red,
                                              Icons.backspace,
                                              model,
                                              context,
                                            ),
                                            tenkeyPadIcon(
                                              '決定',
                                              Colors.blue,
                                              Icons.keyboard_return,
                                              model,
                                              context,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        icontextLabel(Icons.dialpad, '社員番号の入力'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
