import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:works/configs.dart';

class ClockModel extends ChangeNotifier {
  String date = '';
  String time = '';

  void startDateTime() async {
    await Timer.periodic(
      Duration(seconds: 1),
      _updateDateTime,
    );
  }

  _updateDateTime(Timer timer) {
    initializeDateFormatting('ja_JP');
    var now = DateTime.now();
    date = DateFormat('yyyy/MM/dd (E)', 'ja_JP').format(now);
    time = DateFormat('HH:mm:ss', 'ja_JP').format(now);
    notifyListeners();
  }
}

class RecordModel extends ChangeNotifier {
  List<Record> records = [];

  Future fetchRecords() async {
    await Firebase.initializeApp();
    final docs = await FirebaseFirestore.instance.collection('records').get();
    final records = docs.docs.map((doc) => Record(doc)).toList();
    this.records = records;
    notifyListeners();
  }

  String _datetime = '';

  Future addRecordToFirebase() async {
    initializeDateFormatting('ja_JP');
    final _now = DateTime.now();
    _datetime = DateFormat('yyyy/MM/dd HH:mm:ss', 'ja_JP').format(_now);

    await Firebase.initializeApp();
    await FirebaseFirestore.instance.collection('records').add({
      'datetime': _datetime,
      'createdAt': Timestamp.now(),
    });
  }

  Future updateRecordToFirebase(Record record) async {
    await Firebase.initializeApp();
    final doc = await FirebaseFirestore.instance
        .collection('records')
        .doc(record.documentID);
    await doc.update({
      'datetime': record.datetime,
      'updateAt': Timestamp.now(),
    });
  }

  Future deleteRecordToFirebase(Record record) async {
    await Firebase.initializeApp();
    await FirebaseFirestore.instance
        .collection('records')
        .doc(record.documentID)
        .delete();
  }
}
