import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Permission extends StatefulWidget {
  const Permission({super.key});

  @override
  State<Permission> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Permission> {
  bool _lights = false;
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
                    Text(
                      "LOCATION",
                      style: TextStyle(
                          fontSize: 25, fontFamily: "PlayfairDisplay"),
                    ),
                    SizedBox(
                      width: 143,
                    ),
                    CupertinoSwitch(
                        value: _lights,
                        thumbColor: Colors.red,
                        onChanged: (bool value) {
                          setState(() {
                            _lights = value;
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
                    Text(
                      "NOTIFICATIONS",
                      style: TextStyle(
                          fontSize: 25, fontFamily: "PlayfairDisplay"),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    CupertinoSwitch(
                        value: _lights,
                        thumbColor: Colors.red,
                        onChanged: (bool value) {
                          setState(() {
                            _lights = value;
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
                    Text(
                      "SMS",
                      style: TextStyle(
                          fontSize: 25, fontFamily: "PlayfairDisplay"),
                    ),
                    SizedBox(
                      width: 210,
                    ),
                    CupertinoSwitch(
                        value: _lights,
                        thumbColor: Colors.red,
                        onChanged: (bool value) {
                          setState(() {
                            _lights = value;
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
                    Text(
                      "HOT KEY",
                      style: TextStyle(
                          fontSize: 25, fontFamily: "PlayfairDisplay"),
                    ),
                    SizedBox(
                      width: 160,
                    ),
                    CupertinoSwitch(
                        value: _lights,
                        thumbColor: Colors.red,
                        onChanged: (bool value) {
                          setState(() {
                            _lights = value;
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
