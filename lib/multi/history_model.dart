import 'package:flutter/material.dart';

class HistoryModel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HistoryModelState();
  }
}

class _HistoryModelState extends State<HistoryModel> {
  var list = [
    '09/27 (日) 11:09 島村 裕太 出勤',
    '09/27 (日) 11:09 島村 裕太 出勤',
  ];

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}
