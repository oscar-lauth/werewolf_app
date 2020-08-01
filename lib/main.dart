import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: new Color(0xFF324E75),
          backgroundColor: new Color(0xFF0E2F4E),
          accentColor: new Color(0xFF1FFEAD),
          hintColor: new Color(0xFF136768),
        ),
        home: Menu());
  }
}
