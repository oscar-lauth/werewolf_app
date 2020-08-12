import 'package:flutter/material.dart';

class Lobby extends StatefulWidget {
  @override
  LobbyState createState() => LobbyState();
}

class LobbyState extends State<Lobby> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lobby')),
    );
  }
}
