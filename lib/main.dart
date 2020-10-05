import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:works/view/login_page.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WORKS',
      theme: ThemeData(
        fontFamily: 'MPLUSRounded1c',
      ),
      home: LoginPage(),
    );
  }
}
