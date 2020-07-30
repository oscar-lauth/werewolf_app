import 'package:flutter/material.dart';
import './menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: new Color(0xFF324E75),
            scaffoldBackgroundColor: new Color(0xFF0E2F4E)),
        home: Menu());
  }
}
