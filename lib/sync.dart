import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sync extends StatefulWidget {
  const Sync({super.key});

  @override
  State<Sync> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Sync> {
  bool _autoSync = false; // State for automatic sync switch
  bool _manualSync = false; // State for manual sync switch
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          leading: IconButton(
            icon: const Icon(Icons.arrow_left_sharp, size: 50),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "SYNC",
                  style: TextStyle(fontSize: 30, fontFamily: "PlayfairDisplay"),
                ),
                const SizedBox(
                  height: 80,
                ),
                // Automatic Sync Row
                Container(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "AUTOMATIC SYNC",
                        style: TextStyle(
                            fontSize: 25, fontFamily: "PlayfairDisplay"),
                      ),
                      CupertinoSwitch(
                        value: _autoSync,
                        thumbColor: Colors.red,
                        onChanged: (bool value) {
                          setState(() {
                            _autoSync = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                // Manual Sync Row
                Container(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "MANUAL SYNC",
                        style: TextStyle(
                            fontSize: 25, fontFamily: "PlayfairDisplay"),
                      ),
                      CupertinoSwitch(
                        value: _manualSync,
                        thumbColor: Colors.red,
                        onChanged: (bool value) {
                          setState(() {
                            _manualSync = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
