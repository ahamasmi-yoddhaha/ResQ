import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Permission extends StatefulWidget {
  const Permission({super.key});

  @override
  State<Permission> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Permission> {
  bool _location = false;
  bool _notifications = false;
  bool _sms = false;
  bool _hotKey = false;

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
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: const Text(
                    "PERMISSION ACCESS",
                    style:
                        TextStyle(fontSize: 30, fontFamily: "PlayfairDisplay"),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 35,
                    ),
                    Expanded(
                      child: Text(
                        "LOCATION",
                        style: TextStyle(
                            fontSize: 25, fontFamily: "PlayfairDisplay"),
                      ),
                    ),
                    CupertinoSwitch(
                        value: _location,
                        thumbColor: Colors.red,
                        onChanged: (bool value) {
                          setState(() {
                            _location = value;
                          });
                        })
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 35,
                    ),
                    Expanded(
                      child: Text(
                        "NOTIFICATIONS",
                        style: TextStyle(
                            fontSize: 25, fontFamily: "PlayfairDisplay"),
                      ),
                    ),
                    CupertinoSwitch(
                        value: _notifications,
                        thumbColor: Colors.red,
                        onChanged: (bool value) {
                          setState(() {
                            _notifications = value;
                          });
                        })
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 35,
                    ),
                    Expanded(
                      child: Text(
                        "SMS",
                        style: TextStyle(
                            fontSize: 25, fontFamily: "PlayfairDisplay"),
                      ),
                    ),
                    CupertinoSwitch(
                        value: _sms,
                        thumbColor: Colors.red,
                        onChanged: (bool value) {
                          setState(() {
                            _sms = value;
                          });
                        })
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 35,
                    ),
                    Expanded(
                      child: Text(
                        "HOT KEY",
                        style: TextStyle(
                            fontSize: 25, fontFamily: "PlayfairDisplay"),
                      ),
                    ),
                    CupertinoSwitch(
                        value: _hotKey,
                        thumbColor: Colors.red,
                        onChanged: (bool value) {
                          setState(() {
                            _hotKey = value;
                          });
                        })
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
