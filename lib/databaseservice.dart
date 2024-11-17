import 'dart:developer' as developer;

import 'package:e_cum_sd_app/myprofile.dart';
import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  final _db = FirebaseDatabase.instance;

  create(User user) {
    try {
      _db.ref("USERS").child("USER DATA").set(user.toMap());
    } catch (e) {
      developer.log(e.toString());
    }
  }
}
