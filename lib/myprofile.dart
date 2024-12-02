import 'package:e_cum_sd_app/mainspage.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  int currentIndex = 0; // Track the current selected tab

  // Screens for each tab
  final List<Widget> _screens = [
    const MyProfileScreen(), // The MyProfile screen
    const Center(
        child: Text(
      "Help Screen",
      style: TextStyle(fontFamily: "PlayfairDisplay"),
    )),
    const Center(
        child: Text(
      "Settings Screen",
      style: TextStyle(fontFamily: "PlayfairDisplay"),
    )),
  ];

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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainsPage()),
              );
            },
          ),
        ),

        // Display the screen based on selected tab
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Center the title text
            const Padding(
              padding: EdgeInsets.only(
                  top: 20.0), // Adjust padding for proper alignment
              child: Center(
                child: Text(
                  "MY PROFILE", // Static text for profile
                  style: TextStyle(
                    fontSize: 24, // Font size of the title
                    fontWeight: FontWeight.bold, // Bold font weight
                    color: Colors.black, // Text color
                  ),
                ),
              ),
            ),

            // The profile content is scrollable as before
            Expanded(child: _screens[currentIndex]),
          ],
        ),
      ),
    );
  }
}

// MyProfileScreen is the original profile content
class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  bool _passwordVisible = false; // Track password visibility

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.all(10.0), // Added padding for the entire screen
          child: Column(
            children: [
              // Profile icon at the center top with a camera icon at the bottom-right
              Stack(
                alignment: Alignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 70),
                    child: Icon(
                      Icons.account_circle_rounded,
                      size: 100, // Size of the icon
                      color: Colors.black, // Icon color
                    ),
                  ),
                  Positioned(
                    bottom: -10, // Move the icon a little below
                    right: -10, // Move the icon a little to the right
                    child: IconButton(
                      icon: const Icon(
                        Icons.camera_alt_rounded,
                        size: 30, // Size of the camera icon
                        color: Colors.black,
                      ),
                      onPressed: () {
                        // Camera icon click action
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40), // Add spacing below the profile icon

              // Centered static text labels
              Column(
                children: [
                  // Create 5 static text labels inside containers
                  for (var i = 0; i < 5; i++)
                    Container(
                      width: double
                          .infinity, // Ensure the container takes up full width
                      height: 60.0, // Set a fixed height for uniform size
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      margin: const EdgeInsets.only(
                          bottom: 20), // Space between fields
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color for each field
                        borderRadius: BorderRadius.circular(
                            12), // Rounded corners for the input fields
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12, // Subtle shadow for elegance
                            blurRadius: 6, // Soft shadow for depth
                            spreadRadius: 2, // Slight spread of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: Text(
                          _getLabelText(i), // Static label text
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold, // Bold label text
                            color: Colors.black, // Label text color
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to get label text based on the index
  String _getLabelText(int index) {
    switch (index) {
      case 0:
        return "NAME: Kavya Keerthi";
      case 1:
        return "MOBILE NO.: 7207667653";
      case 2:
        return "MAIL ID.: KavyaKeerthi@gmail.com";
      case 3:
        return "PASSWORD: **********";
      case 4:
        return "CURRENT LOCATION: , hyd,IND";
      default:
        return "";
    }
  }
}
