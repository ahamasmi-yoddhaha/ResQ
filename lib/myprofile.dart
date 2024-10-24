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
    return Scaffold(
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

      // Display the screen based on selected tab
      body: _screens[currentIndex],

      // Bottom navigation bar
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
        currentIndex: currentIndex, // Track the current selected tab
        onTap: (index) =>
            setState(() => currentIndex = index), // Update index on tab click
        items: const [
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
        ],
      ),
    );
  }
}

// MyProfileScreen is the original profile content
class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          // Back arrow button at the top left corner

          // Profile icon at the center top with a camera icon at the bottom-right
          Positioned(
            top: 70.0, // Position from the top of the screen
            left: MediaQuery.of(context).size.width * 0.5 -
                50, // Center horizontally
            child: Stack(
              alignment: Alignment
                  .bottomRight, // Align the camera icon at the bottom-right of the profile icon
              children: [
                const Icon(
                  Icons.account_circle_rounded,
                  size: 100, // Size of the icon
                  color: Colors.black, // Icon color
                ),
                Positioned(
                  bottom: -5, // Slightly position outside to align better
                  right: -7,
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
          ),
          // Centered input fields (TextFields)
          Positioned(
            top: 200.0, // Adjust based on your layout
            left: 0,
            right: 0,
            child: Column(
              children: [
                // Create 5 text fields with labels and icons
                for (var i = 0; i < 5; i++)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0), // Horizontal padding
                    margin: const EdgeInsets.symmetric(
                        vertical: 5), // Reduced top and bottom margins
                    child: TextField(
                      textAlign: TextAlign
                          .left, // Align text to the left inside the box
                      decoration: InputDecoration(
                        labelText:
                            _getLabelText(i), // Label text outside the box
                        labelStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold, // Bold label text
                          color: Colors.black, // Label text color
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.black, width: 1.5), // Black border
                          borderRadius:
                              BorderRadius.circular(11), // Rounded corners
                        ),
                        fillColor:
                            Colors.white, // White background for the text field
                        filled: true,
                        // Add pencil icon for the first four and location icon for the last
                        suffixIcon: i < 4
                            ? const Icon(Icons.edit, color: Colors.black)
                            : const Icon(Icons.location_on,
                                color: Colors.black),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to get label text based on the index
  String _getLabelText(int index) {
    switch (index) {
      case 0:
        return "NAME";
      case 1:
        return "MOBILE NO.";
      case 2:
        return "MAIL ID.";
      case 3:
        return "PASSWORD";
      case 4:
        return "CURRENT LOCATION";
      default:
        return "";
    }
  }
}
