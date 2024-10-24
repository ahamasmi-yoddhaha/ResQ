import 'package:e_cum_sd_app/dashboard.dart';
import 'package:e_cum_sd_app/mylocation.dart';
import 'package:flutter/material.dart';
//import 'package:e_cum_sd_app/dashboard.dart';
import 'package:e_cum_sd_app/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
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
                icon: IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  icon: const Icon(Icons.call),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyLocation()),
                    );
                  },
                ),
                label: 'Helpline',
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Settings()),
                    );
                  },
                ),
                label: 'Settings',
              ),
            ]),
        //drawer: MyDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          title: const Text(
            'RResQ',
            style: TextStyle(fontSize: 24, fontFamily: "PlayfairDisplay"),
          ),
          centerTitle: true,
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
        body: Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(16.0),
                width: 400,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.red.shade900,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Colors.red,
                    width: 3.0,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'EMERGENCY',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontFamily: "PlayfairDisplay"),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              height: 380,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: Colors.black,
                  width: 3.0,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'COMMON HELPLINE NUMBERS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "PlayfairDisplay",
                        color: Colors.black,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Divider(color: Colors.black),
                    const SizedBox(height: 20),
                    for (int i = 1; i <= 15; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Helpline $i: +123456789',
                          style: const TextStyle(
                              fontSize: 20, fontFamily: "PlayfairDisplay"),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
