import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class ClockModel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClockModelState();
  }
}

class _ClockModelState extends State<ClockModel> {
  String _date = '';
  String _time = '';

  @override
  void initState() {
    Timer.periodic(
      Duration(seconds: 1),
      _onTimer,
    );
    super.initState();
  }

  void _onTimer(Timer timer) {
    initializeDateFormatting('ja_JP');
    var _now = DateTime.now();
    var _date_f = DateFormat('yyyy/MM/dd (E)', 'ja_JP');
    var _date_f_now = _date_f.format(_now);
    var _time_f = DateFormat('HH:mm:ss', 'ja_JP');
    var _time_f_now = _time_f.format(_now);
    setState(() {
      _date = _date_f_now;
      _time = _time_f_now;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            _date,
            style: TextStyle(
              fontSize: 38.0,
              color: Colors.black,
              letterSpacing: 2.0,
            ),
          ),
          Text(
            _time,
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
  }
}
