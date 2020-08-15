import 'package:flutter/material.dart';
import 'package:werewolf_app/screens/menu.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          backgroundColor: Colors.grey[900],
          scaffoldBackgroundColor: Colors.grey[900],
          accentColor: Colors.yellow[700],
          hintColor: new Color(0xFF7A642F),
          textTheme: TextTheme(
            // appTitleTheme
            headline1: GoogleFonts.germaniaOne(
                color: Colors.yellow[700], fontSize: 90, letterSpacing: -2),
            // sheetTitleTheme
            headline2: GoogleFonts.germaniaOne(
                color: Colors.yellow[700], fontSize: 30),
            // hintTheme
            headline3: GoogleFonts.carterOne(
                color: new Color(0xFF7A642F), fontSize: 35),
            // gameIDInputTheme
            headline4:
                GoogleFonts.carterOne(color: Colors.yellow[700], fontSize: 60),
            // gameIDCornerTheme
            headline5:
                GoogleFonts.carterOne(color: Colors.yellow[700], fontSize: 30),
            // nameInputTheme
            headline6:
                GoogleFonts.carterOne(color: Colors.yellow[700], fontSize: 40),
            // buttonTheme
            button: GoogleFonts.carterOne(
              color: Colors.yellow[700],
              fontSize: 30,
            ),
          ),
        ),
        home: Menu());
  }
}
