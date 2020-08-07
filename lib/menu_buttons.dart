import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './menu_sheets.dart';

class JoinGameButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        child: Text("Join Game",
            style: GoogleFonts.medievalSharp(
                color: Theme.of(context).backgroundColor, fontSize: 30)),
        color: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {
          showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (BuildContext context) => JoinGameSheet());
        });
  }
}

class HostGameButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        child: Text("Host Game",
            style: GoogleFonts.medievalSharp(
                color: Theme.of(context).accentColor, fontSize: 30)),
        color: Theme.of(context).backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {
          showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (BuildContext context) => HostGameSheet());
        });
  }
}
