import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:works/choice_page.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WORKS',
      theme: ThemeData(
        fontFamily: 'MPLUSRounded1c',
      ),
      home: ChoicePage(),
    );
  }
}
