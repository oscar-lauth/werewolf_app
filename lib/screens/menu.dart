import 'package:flutter/material.dart';
import 'package:werewolf_app/components/menu_buttons.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // prevents renderflex overflow when keyboard pops up
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * .20),
            Text(
              "Werewolf",
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .40),
            JoinGameButton(),
            SizedBox(height: 35),
            HostGameButton(),
          ],
        ),
      ),
    );
  }
}
