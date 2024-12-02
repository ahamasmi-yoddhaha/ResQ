import 'package:e_cum_sd_app/dashboard.dart';
import 'package:e_cum_sd_app/databaseservice.dart';
import 'package:e_cum_sd_app/homepage.dart';
import 'package:e_cum_sd_app/mainspage.dart';
import 'package:flutter/material.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final _dbService = DatabaseService();

  final _name = TextEditingController();
  final _age = TextEditingController();
  final _mobilenumber = TextEditingController();
  final _emailid = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData(); // Load existing user data when the page is loaded
  }

  // Load existing user data from the database
  Future<void> _loadUserData() async {
    final user = await _dbService.getUser(); // Fetch the user data from DB

    if (user != null) {
      // Populate the fields with the data from the database
      _name.text = user.name;
      _age.text = user.age;
      _mobilenumber.text = user.mobilenumber;
      _emailid.text = user.emailid;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _age.dispose();
    _mobilenumber.dispose();
    _emailid.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 40),
                const Text(
                  "UPDATE PROFILE",
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
                TextField(
                    controller: _name,
                    decoration: InputDecoration(
                        hintText: "Enter Name",
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(11),
                        ))),
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
                TextField(
                    controller: _age,
                    decoration: InputDecoration(
                        hintText: "Enter Age",
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(11),
                        ))),
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
                TextField(
                    controller: _mobilenumber,
                    decoration: InputDecoration(
                        hintText: "Enter Phone Number",
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(11),
                        ))),
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
                      "Email id",
                      style: TextStyle(
                          fontSize: 15, fontFamily: "PlayfairDisplay"),
                    ),
                  ],
                ),
                TextField(
                    controller: _emailid,
                    decoration: InputDecoration(
                        hintText: "Enter email id",
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(11),
                        ))),
                SizedBox(height: 40),
                // Save button
                ElevatedButton(
                  onPressed: () {
                    final user = User(
                        name: _name.text,
                        age: _age.text,
                        mobilenumber: _mobilenumber.text,
                        emailid: _emailid.text);
                    _dbService.createOrUpdateUser(user); // Save the data
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainsPage()));
                  },
                  child: Text(
                    "SAVE",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "PlayfairDisplay",
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(150, 50),
                    backgroundColor: Colors.grey[400],
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
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
