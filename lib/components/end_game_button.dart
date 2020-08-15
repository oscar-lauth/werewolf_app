import 'package:flutter/material.dart';
import 'package:werewolf_app/backend/database_functions.dart';
import 'package:werewolf_app/screens/menu.dart';

class EndGameButton extends StatelessWidget {
  final String gameID;
  final bool host;
  EndGameButton({Key key, @required this.gameID, @required this.host})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: host,
      child: FlatButton(
        padding: const EdgeInsets.only(bottom: 4, top: 4, left: 20, right: 20),
        child: Text("END GAME", style: Theme.of(context).textTheme.button),
        color: Theme.of(context).backgroundColor,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Theme.of(context).accentColor, width: 3),
            borderRadius: BorderRadius.circular(50)),
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                backgroundColor: Theme.of(context).backgroundColor,
                child: Container(
                  height: MediaQuery.of(context).size.height * .3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(20),
                        child: Text("End this game and delete all data?",
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                      SizedBox(height: 25),
                      FlatButton(
                        padding: const EdgeInsets.only(
                            bottom: 4, top: 4, left: 20, right: 20),
                        child: Text("END GAME",
                            style: Theme.of(context).textTheme.subtitle1),
                        color: Theme.of(context).backgroundColor,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.red, width: 3),
                            borderRadius: BorderRadius.circular(50)),
                        onPressed: () {
                          endGame(gameID);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Menu()),
                              (route) => false);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
