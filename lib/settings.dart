import 'package:e_cum_sd_app/help.dart';
import 'package:e_cum_sd_app/permission.dart';
import 'package:e_cum_sd_app/dashboard.dart';
import 'package:e_cum_sd_app/sync.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leading: IconButton(
          icon: const Icon(Icons.dehaze_rounded),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Dashboard()),
            );
          },
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 40,
          ),
          const Text(
            'SETTINGS',
            style: TextStyle(fontSize: 30, fontFamily: "PlayfairDisplay"),
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Permission()),
              );
            },
            child: Container(
              child: Text(
                "PERMISSION ACCESS",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontFamily: "PlayfairDisplay"),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 1.5),
                  borderRadius: BorderRadius.circular(11)),
              width: 340,
              height: 55.0,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Sync()),
              );
            },
            child: Container(
              child: Text(
                "SYNC",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontFamily: "PlayfairDisplay"),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 1.5),
                  borderRadius: BorderRadius.circular(11)),
              width: 340,
              height: 55.0,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Help()),
              );
            },
            child: Container(
              child: Text(
                "HELP",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontFamily: "PlayfairDisplay"),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 1.5),
                  borderRadius: BorderRadius.circular(11)),
              width: 340,
              height: 55.0,
            ),
          ),
        ]),
      ),
    ));
  }
}
