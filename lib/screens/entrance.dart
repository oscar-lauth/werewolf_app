import 'package:flutter/material.dart';
import 'package:werewolf_app/backend/database_functions.dart';
import 'package:werewolf_app/screens/lobby.dart';

class Entrance extends StatefulWidget {
  final String gameID;
  Entrance({Key key, @required this.gameID}) : super(key: key);
  @override
  EntranceState createState() => EntranceState();
}

class EntranceState extends State<Entrance> {
  bool _validateName = true;
  String _name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 40, left: 30),
              child: Text(
                widget.gameID,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 150, left: 90, right: 90),
              child: TextField(
                autocorrect: false,
                textAlign: TextAlign.center,
                cursorColor: Theme.of(context).accentColor,
                style: Theme.of(context).textTheme.headline6,
                decoration: InputDecoration(
                  hintText: "NAME",
                  hintStyle: Theme.of(context).textTheme.headline3,
                  errorText: _validateName ? null : 'Name Taken',
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).accentColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).accentColor),
                  ),
                ),
                maxLines: 1,
                onChanged: (String inputName) async {
                  _validateName = await isValidName(widget.gameID, inputName);
                  setState(() => _validateName);
                  _name = inputName;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 60, left: 120, right: 120),
              child: FlatButton(
                  padding: const EdgeInsets.only(
                      bottom: 4, top: 4, left: 20, right: 20),
                  child:
                      Text("JOIN", style: Theme.of(context).textTheme.button),
                  color: Theme.of(context).backgroundColor,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Theme.of(context).accentColor, width: 3),
                      borderRadius: BorderRadius.circular(50)),
                  onPressed: () async {
                    if (_validateName && _name != "") {
                      List<String> newRoles =
                          await addPlayer(widget.gameID, _name, false);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Lobby(
                                  gameID: widget.gameID,
                                  roles: newRoles,
                                  host: false)),
                          (route) => false);
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
