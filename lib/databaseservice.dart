import 'dart:developer' as developer;

import 'package:e_cum_sd_app/myprofile.dart';
import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  final _db = FirebaseDatabase.instance;

  create(User user) {
    try {
      _db.ref("USER1").child("USER DATA").set(user.toMap());
    } catch (e) {
      developer.log(e.toString());
    }
  }

  read(User user) async {
    try {
      final data = await _db.ref("USER1").onValue;
      data.listen(
        (event) {
          developer.log(event.snapshot.children.toList()[0].value.toString());
        },
      );
    } catch (e) {
      developer.log(e.toString());
    }
  }

  update() async {
    try {
      _db.ref("USER1").child("USER DATA").update({});
    } catch (e) {}
  }
}
