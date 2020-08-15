import 'package:flutter/material.dart';

class Lobby extends StatefulWidget {
  final List<String> roles;
  Lobby({Key key, @required this.roles}) : super(key: key);
  @override
  LobbyState createState() => LobbyState();
}

class LobbyState extends State<Lobby> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: <Widget>[
        SizedBox(height: 100),
        Text(widget.roles[0], style: Theme.of(context).textTheme.headline4),
        Text(widget.roles[1], style: Theme.of(context).textTheme.headline4)
      ],
    )));
  }
}
