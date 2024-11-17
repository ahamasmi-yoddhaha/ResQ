import 'package:e_cum_sd_app/homepage.dart';
import 'package:e_cum_sd_app/updateprofile.dart';
import 'package:e_cum_sd_app/myprofile.dart';
import 'package:e_cum_sd_app/savedcontacts.dart';
import 'package:e_cum_sd_app/savedlocation.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Icon(
                Icons.account_circle_rounded,
                size: 100,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "USERNAME",
                style: TextStyle(fontFamily: "PlayfairDisplay"),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "LOCATION ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "PlayfairDisplay",
                    ),
                  ),
                  Icon(Icons.location_on)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyProfile()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "MY PROFILE",
                      style: TextStyle(
                        fontFamily: "PlayfairDisplay",
                      ),
                    ),
                    Icon(Icons.border_color_rounded)
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SavedContacts()),
                  );
                },
                child: Container(
                  child: Text(
                    "SAVED CONTACTS",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 30, fontFamily: "PlayfairDisplay"),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(11)),
                  width: 340,
                  height: 55.0,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SavedLocation()),
                  );
                },
                child: Container(
                  child: Text(
                    "SAVED LOCATIONS",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 30, fontFamily: "PlayfairDisplay"),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(11)),
                  width: 340,
                  height: 55.0,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: Text(
                    "RATE/REVIEW US",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 30, fontFamily: "PlayfairDisplay"),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(11)),
                  width: 340,
                  height: 55.0,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: Text(
                    "LOGOUT",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 30, fontFamily: "PlayfairDisplay"),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(11)),
                  width: 340,
                  height: 55.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
