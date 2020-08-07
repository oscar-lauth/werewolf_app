import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import './database_functions.dart';

class JoinGameSheet extends StatefulWidget {
  JoinGameSheetState createState() => JoinGameSheetState();
}

class JoinGameSheetState extends State<JoinGameSheet> {
  bool _validate = true;
  @override
  Widget build(BuildContext context) {
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
            margin: EdgeInsets.only(top: 60, left: 120, right: 120),
            child: TextField(
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  color: Theme.of(context).accentColor,
                ),
                decoration: InputDecoration(
                  hintText: "Game ID",
                  hintStyle: TextStyle(color: Theme.of(context).hintColor),
                  counterText: "",
                  errorText: _validate ? null : 'Invalid Game ID',
                ),
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                maxLength: 3,
                maxLengthEnforced: true,
                onChanged: (String inputGameID) async {
                  setState(() => _validate = true); //no errorText when length<3
                  if (inputGameID.length == 3) {
                    await isValidID(inputGameID)
                        .then((value) => _validate = value);
                    setState(() => _validate);
                    if (_validate) {
                      //joinGame(inputGameID)/send to lobby page
                    }
                  }
                }),
          ),
        ],
      ),
    );
  }
}

class HostGameSheet extends StatelessWidget {
  final List<int> timeOptions = [30, 45, 60, 75, 90];
  final FixedExtentScrollController _controller =
      new FixedExtentScrollController(initialItem: 2);
  //int tempTime;
  @override
  Widget build(BuildContext context) {
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
            "Host Game",
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).accentColor,
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width * .40,
                child: Text(
                  "Game Timer:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                height: 108,
                width: MediaQuery.of(context).size.width * .20,
                child: CupertinoPicker(
                  onSelectedItemChanged: (index) => null,
                  scrollController: _controller,
                  itemExtent: 27,
                  children: [
                    Text("30:00", style: TextStyle(fontSize: 24)),
                    Text("45:00", style: TextStyle(fontSize: 24)),
                    Text("60:00", style: TextStyle(fontSize: 24)),
                    Text("75:00", style: TextStyle(fontSize: 24)),
                    Text("90:00", style: TextStyle(fontSize: 24)),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .40,
              ),
            ],
          ),
          FlatButton(
            child: Text("Host Game",
                style: GoogleFonts.medievalSharp(
                    color: Theme.of(context).accentColor, fontSize: 30)),
            color: Theme.of(context).backgroundColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onPressed: () {
              //HostGame(time);
            },
          ),
        ],
      ),
    );
  }
}
