import 'package:firebase_database/firebase_database.dart';

Future<bool> isValidID(String id) {
  final DatabaseReference dbref = FirebaseDatabase.instance.reference();
  return dbref.child(id).once().then((DataSnapshot data) {
    return data.value != null;
  });
}
