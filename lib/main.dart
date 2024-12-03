import 'package:e_cum_sd_app/dashboard.dart';
import 'package:e_cum_sd_app/homepage.dart';
import 'package:e_cum_sd_app/locations.dart';
import 'package:e_cum_sd_app/loginpage.dart';
import 'package:e_cum_sd_app/mainspage.dart';
import 'package:e_cum_sd_app/mappage.dart';
import 'package:e_cum_sd_app/savedcontacts.dart';
import 'package:e_cum_sd_app/savedlocation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'
    show Firebase, FirebaseOptions;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyBoNdyACL9qarXLcqcXiMLh9VgFcBq9O88',
    appId: "1:290567846891:android:d36094a3a78d7f0f25b7ae",
    messagingSenderId: "290567846891",
    projectId: "e-cum-sd-app",
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: MainsPage());
  }
}
