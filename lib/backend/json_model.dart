// use app.quicktype.io to create dart json model
// change all Map<String, object/dynamic> to Map<dynamic, object/dynamic>

// final game = gameFromJson(jsonString) <-- models entire db
// final game = Game.fromJson(jsonString) <-- models single Game object(gameID node)
// final player = Player.fromJson(jsonString) <-- models single Player object

import 'dart:convert';

Map<dynamic, Game> gameFromJson(String str) => Map.from(json.decode(str))
    .map((k, v) => MapEntry<dynamic, Game>(k, Game.fromJson(v)));

String gameToJson(Map<dynamic, Game> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<dynamic, dynamic>(k, v.toJson())));

class Game {
  Game({
    this.randomTrueRoles,
    this.randomFakeRoles,
    this.players,
    this.timer,
  });

  List<String> randomTrueRoles;
  List<String> randomFakeRoles;
  Map<String, Player> players;
  int timer;

  factory Game.fromJson(Map<dynamic, dynamic> json) => Game(
        randomTrueRoles:
            List<String>.from(json["randomTrueRoles"].map((x) => x)),
        randomFakeRoles:
            List<String>.from(json["randomFakeRoles"].map((x) => x)),
        players: Map<String, Player>.from(json["players"].map((x) => x)),
        timer: json["timer"],
      );

  Map<dynamic, dynamic> toJson() => {
        "randomTrueRoles": List<dynamic>.from(randomTrueRoles.map((x) => x)),
        "randomFakeRoles": List<dynamic>.from(randomFakeRoles.map((x) => x)),
        "players":
            Map<dynamic, dynamic>.from(players.map((k, v) => MapEntry(k, v))),
        "timer": timer,
      };
}

class Player {
  Player({
    this.trueRole,
    this.fakeRole,
    this.host,
  });

  String trueRole;
  String fakeRole;
  bool host;

  factory Player.fromJson(Map<dynamic, dynamic> json) => Player(
        trueRole: json["trueRole"],
        fakeRole: json["fakeRole"],
        host: json["host"],
      );

  Map<dynamic, dynamic> toJson() => {
        "trueRole": trueRole,
        "fakeRole": fakeRole,
        "host": host,
      };
}
