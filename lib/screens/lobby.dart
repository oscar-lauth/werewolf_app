import 'package:flutter/material.dart';
import 'package:werewolf_app/backend/database_functions.dart';
import 'package:werewolf_app/components/end_game_button.dart';

class Lobby extends StatefulWidget {
  final List<String> roles;
  final String gameID;
  final bool host;
  Lobby(
      {Key key,
      @required this.gameID,
      @required this.roles,
      @required this.host})
      : super(key: key);
  @override
  LobbyState createState() => LobbyState();
}

class LobbyState extends State<Lobby> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 40, left: 30),
                  child: Text(
                    widget.gameID,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(top: 40, right: 30),
                  child: Text(
                    "\u20B6 " + getMoney(widget.roles[1]).toString(),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ],
            ),
            SizedBox(height: 100),
            Text(widget.roles[0], style: Theme.of(context).textTheme.headline4),
            Text(widget.roles[1], style: Theme.of(context).textTheme.headline4),
            EndGameButton(gameID: widget.gameID, host: widget.host),
          ],
        ),
      ),
    );
  }
}
