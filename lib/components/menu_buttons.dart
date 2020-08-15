import 'package:flutter/material.dart';
import 'package:werewolf_app/components/menu_sheets.dart';

class JoinGameButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        padding: const EdgeInsets.only(bottom: 4, top: 4, left: 20, right: 20),
        child: Text("JOIN GAME", style: Theme.of(context).textTheme.button),
        color: Theme.of(context).backgroundColor,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Theme.of(context).accentColor, width: 3),
            borderRadius: BorderRadius.circular(50)),
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
        padding: const EdgeInsets.only(bottom: 4, top: 4, left: 20, right: 20),
        child: Text("HOST GAME", style: Theme.of(context).textTheme.button),
        color: Theme.of(context).backgroundColor,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Theme.of(context).accentColor, width: 3),
            borderRadius: BorderRadius.circular(50)),
        onPressed: () {
          showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (BuildContext context) => HostGameSheet());
        });
  }
}
