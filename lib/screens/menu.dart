import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:werewolf_app/components/menu_buttons.dart';

class Menu extends StatefulWidget {
  @override
  MenuState createState() => MenuState();
}

class MenuState extends State<Menu> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Werewolf Menu',
            style: GoogleFonts.medievalSharp(
                color: Theme.of(context).accentColor, fontSize: 30)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            JoinGameButton(),
            HostGameButton(),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
