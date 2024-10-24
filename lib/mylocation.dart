import 'package:flutter/material.dart';
import 'package:e_cum_sd_app/settings.dart';
import 'package:e_cum_sd_app/homepage.dart';

class MyLocation extends StatefulWidget {
  const MyLocation({super.key});

  @override
  State<MyLocation> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyLocation> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext ccontext) {
    var container = Container(
      width: 300,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(11),
        color: Colors.white,
      ),
      margin: EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                Icons.local_hospital,
                size: 40,
                color: Colors.red,
              ),
              SizedBox(
                width: 20,
              ),
              Center(
                child: Text(
                  'HOSPITAL',
                  style: TextStyle(
                    fontFamily: "PlayfairDisplay",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'City Hospital',
            style: TextStyle(
              fontFamily: "PlayfairDisplay",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.call, color: Colors.black),
                label: Text('Call',
                    style: TextStyle(
                        color: Colors.black, fontFamily: "PlayfairDisplay")),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.location_on,
                  color: Colors.black,
                ),
                label: Text(
                  'Location',
                  style: TextStyle(
                      color: Colors.black, fontFamily: "PlayfairDisplay"),
                ),
              ),
            ],
          )
        ],
      ),
    );
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
                label: 'HOME',
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
                label: 'HELP NO',
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
                label: 'SETTINGS',
              ),
            ]),
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
                const Text(
                  "MY LOCATION",
                  style: TextStyle(fontSize: 30, fontFamily: "PlayfairDisplay"),
                ),
                SizedBox(
                  height: 50,
                ),
                container,
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.all(5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.local_police_outlined,
                            size: 40,
                            color: Color(0xff0f2750),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'POLICE',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: "PlayfairDisplay"),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Local Police',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "PlayfairDisplay"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.call, color: Colors.black),
                            label: Text('Call',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "PlayfairDisplay")),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.location_on, color: Colors.black),
                            label: Text('Location',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "PlayfairDisplay")),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
