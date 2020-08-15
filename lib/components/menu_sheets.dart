import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:werewolf_app/backend/database_functions.dart';
import 'package:werewolf_app/screens/entrance.dart';
import 'package:werewolf_app/screens/lobby.dart';
import 'dart:math';

class JoinGameSheet extends StatefulWidget {
  JoinGameSheetState createState() => JoinGameSheetState();
}

class JoinGameSheetState extends State<JoinGameSheet> {
  bool _validateID = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
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
            style: Theme.of(context).textTheme.headline2,
          ),
          Container(
            margin: EdgeInsets.only(top: 60, left: 120, right: 120),
            child: TextField(
                textAlign: TextAlign.center,
                cursorColor: Theme.of(context).accentColor,
                style: Theme.of(context).textTheme.headline4,
                decoration: InputDecoration(
                  hintText: "GAME ID",
                  hintStyle: Theme.of(context).textTheme.headline3,
                  counterText: "",
                  errorText: _validateID ? null : 'Invalid Game ID',
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).accentColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).accentColor),
                  ),
                ),
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                maxLength: 3,
                maxLengthEnforced: true,
                onChanged: (String inputGameID) async {
                  setState(
                      () => _validateID = true); //no errorText when length<3
                  if (inputGameID.length == 3) {
                    _validateID = await isExistingID(inputGameID);
                    setState(() => _validateID);
                    if (_validateID) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Entrance(gameID: inputGameID)));
                    }
                  }
                }),
          ),
        ],
      ),
    );
  }
}

class HostGameSheet extends StatefulWidget {
  HostGameSheetState createState() => HostGameSheetState();
}

class HostGameSheetState extends State<HostGameSheet> {
  String _name = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
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
            "Host Game",
            style: Theme.of(context).textTheme.headline2,
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 90, right: 90),
            child: TextField(
              autocorrect: false,
              textAlign: TextAlign.center,
              cursorColor: Theme.of(context).accentColor,
              style: Theme.of(context).textTheme.headline6,
              decoration: InputDecoration(
                hintText: "NAME",
                hintStyle: Theme.of(context).textTheme.headline3,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).accentColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).accentColor),
                ),
              ),
              maxLines: 1,
              onChanged: (String inputName) {
                _name = inputName;
              },
            ),
          ),
          SizedBox(height: 25),
          FlatButton(
            padding:
                const EdgeInsets.only(bottom: 4, top: 4, left: 20, right: 20),
            child: Text("JOIN", style: Theme.of(context).textTheme.button),
            color: Theme.of(context).backgroundColor,
            shape: RoundedRectangleBorder(
                side:
                    BorderSide(color: Theme.of(context).accentColor, width: 3),
                borderRadius: BorderRadius.circular(50)),
            onPressed: () async {
              if (_name != "") {
                String newGameID = (new Random().nextInt(900) + 100)
                    .toString(); //generate random 3 digit num
                while (await isExistingID(newGameID)) {
                  newGameID = (new Random().nextInt(900) + 100)
                      .toString(); //generate random 3 digit num
                }
                setupGame(newGameID);
                List<String> newRoles = await addPlayer(newGameID, _name, true);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Lobby(roles: newRoles)),
                    (route) => false);
              }
            },
          ),
        ],
      ),
    );
  }
}
