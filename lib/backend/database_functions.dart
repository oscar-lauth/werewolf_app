import 'package:firebase_database/firebase_database.dart';

final DatabaseReference dbref = FirebaseDatabase.instance.reference();
final List<String> trueRoles = [
  'werewolf',
  'seer',
  'minion',
  'thief',
  'villager',
  'villager'
];
final List<String> fakeRoles = [
  'knight',
  'innkeeper',
  'bard',
  'archer',
  'stable boy',
  'blacksmith'
];

Future<bool> isExistingID(String gameID) {
  // returns if gameID already exists
  return dbref.child(gameID).once().then((DataSnapshot data) {
    return data.value != null;
  });
}

Future<bool> isValidName(String gameID, String name) {
  //ensures name is unique in game
  return dbref.child("$gameID/players/$name").once().then((DataSnapshot data) {
    return data.value == null;
  });
}

void setupGame(String gameID) {
  trueRoles.shuffle();
  fakeRoles.shuffle();
  dbref.child(gameID).set({
    "randomTrueRoles": trueRoles,
    "randomFakeRoles": fakeRoles,
    "players": {},
    "playerIndex": 0,
  });
}

Future<String> getTrueRole(String gameID, String playerName) {
  return dbref
      .child("$gameID/players/$playerName")
      .once()
      .then((DataSnapshot data) {
    return data.value["trueRole"];
  });
}

// consider making this file a class where constructor passes gameID and dbref and then can use all methods
// Future<List<List<String>>> getPlayerInfo(String gameID) {
//   // gets player name and fakeRole
//   List<List<String>> playerInfo = [];
//   return dbref.child("$gameID/players").once().then((DataSnapshot data) {
//     for (var player in data.value) playerInfo.add(player)
//     });
//     return playerInfo;
//   });
// }
Future<List<String>> addPlayer(String gameID, String name, bool host) async {
  int playerIndex = await getPlayerIndex(gameID);
  List<String> roles = await getNextRoles(gameID, playerIndex);
  dbref.child("$gameID/players/$name").set({
    "trueRole": roles[0],
    "fakeRole": roles[1],
    "host": host,
  });
  await incrementPlayerIndex(gameID);
  return roles;
}

Future<int> getPlayerIndex(String gameID) {
  return dbref.child("$gameID/playerIndex").once().then((DataSnapshot data) {
    return data.value;
  });
}

Future<List<String>> getNextRoles(String gameID, int playerIndex) {
  return dbref.child(gameID).once().then((DataSnapshot data) {
    return [
      data.value["randomTrueRoles"][playerIndex],
      data.value["randomFakeRoles"][playerIndex]
    ];
  });
}

Future<void> incrementPlayerIndex(String gameID) async {
  int currentPlayerIndex = await getPlayerIndex(gameID);
  currentPlayerIndex++;
  dbref.child("$gameID").update({
    "playerIndex": currentPlayerIndex,
  });
}
