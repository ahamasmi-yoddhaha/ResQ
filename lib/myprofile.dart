import 'package:e_cum_sd_app/databaseservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final _dbService = DatabaseService();

  final _name = TextEditingController();
  final _age = TextEditingController();
  final _mobilenumber = TextEditingController();
  final _emailid = TextEditingController();
  @override
  void dispose() {
    super.dispose();

    _name.dispose();
    _age.dispose();
    _mobilenumber.dispose();
    _emailid.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          leading: IconButton(
            icon: const Icon(Icons.arrow_left_sharp, size: 50),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "MY PROFILE",
                  style: TextStyle(fontSize: 30, fontFamily: "PlayfairDisplay"),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Name",
                      style: TextStyle(
                          fontSize: 15, fontFamily: "PlayfairDisplay"),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _name,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Age",
                      style: TextStyle(
                          fontSize: 15, fontFamily: "PlayfairDisplay"),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _age,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Mobile Number",
                      style: TextStyle(
                          fontSize: 15, fontFamily: "PlayfairDisplay"),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _mobilenumber,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Email Id",
                      style: TextStyle(
                          fontSize: 15, fontFamily: "PlayfairDisplay"),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _emailid,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    final user = User(
                        name: _name.text,
                        age: _age.text,
                        mobilenumber: _mobilenumber.text,
                        emailid: _emailid.text);
                    _dbService.create(user);
                  },
                  child: Text(
                    "SAVE",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "PlayfairDisplay",
                        fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(150, 50),
                      backgroundColor: Colors.grey[400],
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(9))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class User {
  final String name;
  final String age;
  final String mobilenumber;
  final String emailid;

  User(
      {required this.name,
      required this.age,
      required this.mobilenumber,
      required this.emailid});

  Map<String, dynamic> toMap() => {
        "name": name,
        "age": age,
        "mobilenumber": mobilenumber,
        "emailid": emailid
      };
}
