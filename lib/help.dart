import 'package:flutter/material.dart';
import 'package:e_cum_sd_app/settings.dart';
import 'package:e_cum_sd_app/homepage.dart';
import 'package:e_cum_sd_app/mylocation.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          leading: IconButton(
            icon: const Icon(Icons.arrow_left_sharp, size: 50),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: const SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 08,
                ),
                Text(
                  "HELP",
                  style: TextStyle(fontSize: 30, fontFamily: "PlayfairDisplay"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
