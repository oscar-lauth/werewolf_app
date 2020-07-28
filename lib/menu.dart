import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './lobby.dart';

class Menu extends StatefulWidget {
  @override
  MenuState createState() => MenuState();
}

class MenuState extends State<Menu> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Werewolf Menu',
              style: GoogleFonts.medievalSharp(color: Colors.yellow[700]))),
      body: Center(
          child: Container(
              width: 200,
              height: 75,
              child: TextField(
                  decoration: InputDecoration(
                      hintText: "Enter 3 Digit Game-ID", counterText: ""),
                  maxLength: 3,
                  maxLengthEnforced: true,
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: false, signed: false)))),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Lobby(),
          child: Text("Join Game"),
          shape: BeveledRectangleBorder()),
    );
  }
}
