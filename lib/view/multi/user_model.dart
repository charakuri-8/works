import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String email = '';
  String password = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signUpToFirebase() async {
    if (email.isEmpty) throw ('メールアドレスを入力してください');
    if (password.isEmpty) throw ('パスワードを入力してください');

    final User user = (await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;

    await Firebase.initializeApp();
    await FirebaseFirestore.instance.collection('users').add({
      'email': email,
      'password': password,
      'createdAt': Timestamp.now(),
    });
  }

  Future signInToFirebase() async {
    if (email.isEmpty) throw ('メールアドレスを入力してください');
    if (password.isEmpty) throw ('パスワードを入力してください');

    final result = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final uid = result.user.uid;
  }
}
