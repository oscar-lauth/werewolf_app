import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  color: new Color(0xFF1FFEAD), fontSize: 30))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            FlatButton(
                child: Text("Join Game",
                    style: GoogleFonts.medievalSharp(
                        color: new Color(0xFF0E2F4E), fontSize: 30)),
                color: new Color(0xFF1FFEAD),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: () {
                  showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (BuildContext context) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.75,
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(25.0),
                              topRight: const Radius.circular(25.0),
                            ),
                          ),
                        );
                      });
                }),
            FlatButton(
                child: Text("Host Game",
                    style: GoogleFonts.medievalSharp(
                        color: new Color(0xFF1FFEAD), fontSize: 30)),
                color: new Color(0xFF0E2F4E),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: () {
                  showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (BuildContext context) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.75,
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(25.0),
                              topRight: const Radius.circular(25.0),
                            ),
                          ),
                        );
                      });
                }),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
