import 'package:flutter/material.dart';
import 'package:infix_postfix_prefix/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      // initialRoute: ,
    );
  }
}
