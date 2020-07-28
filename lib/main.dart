import 'package:flutter/material.dart';
import './menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.grey[900],
            scaffoldBackgroundColor: Colors.grey[800]),
        home: Menu());
  }
}
