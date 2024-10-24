import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sync extends StatefulWidget {
  const Sync({super.key});

  @override
  State<Sync> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Sync> {
  bool _lights = false;
  int currentIndex = 0;
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
              child: Column(children: [
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
            SizedBox(
              height: 80,
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "AUTOMATIC SYNC",
                    style:
                        TextStyle(fontSize: 25, fontFamily: "PlayfairDisplay"),
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
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "MANUAL SYNC",
                    style:
                        TextStyle(fontSize: 25, fontFamily: "PlayfairDisplay"),
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
            ),
          ])),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            backgroundColor: Colors.white,
            iconSize: 25.0,
            selectedFontSize: 20,
            unselectedFontSize: 15,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'HOME',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.call),
                label: 'HELP NO',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'SETTINGS',
              ),
            ]),
      ),
    );
  }
}
