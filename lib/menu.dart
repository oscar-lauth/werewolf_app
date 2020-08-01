import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Menu extends StatefulWidget {
  @override
  MenuState createState() => MenuState();
}

class MenuState extends State<Menu> {
  bool _validate = true;

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
            FlatButton(
                child: Text("Join Game",
                    style: GoogleFonts.medievalSharp(
                        color: Theme.of(context).backgroundColor,
                        fontSize: 30)),
                color: Theme.of(context).accentColor,
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
                            color: Theme.of(context).backgroundColor,
                            borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(25.0),
                              topRight: const Radius.circular(25.0),
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 15),
                              Text(
                                "Join Game",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 60, left: 120, right: 120),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: Theme.of(context).accentColor,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "Game ID",
                                    hintStyle: TextStyle(
                                        color: Theme.of(context).hintColor),
                                    counterText: "",
                                    errorText:
                                        _validate ? null : 'Invalid Game ID',
                                  ),
                                  inputFormatters: [
                                    WhitelistingTextInputFormatter.digitsOnly
                                  ],
                                  keyboardType: TextInputType.numberWithOptions(
                                      signed: false, decimal: false),
                                  maxLength: 3,
                                  maxLengthEnforced: true,
                                  onChanged: (String inputGameID) {
                                    if (inputGameID.length == 3) {
                                      //_validate = isValid(inputGameID);
                                      setState(() {
                                        _validate = false;
                                      });
                                      if (_validate) {
                                        //joinGame(inputGameID)/send to lobby page
                                      }
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                }),
            FlatButton(
                child: Text("Host Game",
                    style: GoogleFonts.medievalSharp(
                        color: Theme.of(context).accentColor, fontSize: 30)),
                color: Theme.of(context).backgroundColor,
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
                            color: Theme.of(context).backgroundColor,
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
