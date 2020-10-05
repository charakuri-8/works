import 'package:cloud_firestore/cloud_firestore.dart';

class Record {
  Record(DocumentSnapshot doc) {
    documentID = doc.id;
    datetime = doc.data()['datetime'];
  }

  String documentID;
  String datetime;
}
