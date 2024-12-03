import 'package:e_cum_sd_app/locations.dart';
import 'package:e_cum_sd_app/myprofile.dart';
import 'package:e_cum_sd_app/savedcontacts.dart';
import 'package:e_cum_sd_app/savedlocation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FractionallySizedBox(
        widthFactor:
            1.0, // Ensure the content stays within the three-fourths view
        child: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Profile Avatar
                    Center(
                      child: CircleAvatar(
                        radius: 40, // Adjusted size for visibility
                        backgroundColor: Colors.grey[100],
                        child: ClipOval(
                          child: Image.asset(
                            'images/profile.jpg',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Title
                    Text(
                      "    Welcome, Kavya Keerti!",
                      style: GoogleFonts.playball(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Profile Section
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyProfile()),
                        );
                      },
                      child: ListTile(
                        leading: const Icon(Icons.person, color: Colors.black),
                        title: Text(
                          "     My Profile",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontSize: 18, // Adjusted font size
                                  fontFamily: "PlayfairDisplay",
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const Divider(),

                    // Saved Contacts
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SavedContacts()),
                        );
                      },
                      child: ListTile(
                        leading:
                            const Icon(Icons.contacts, color: Colors.black),
                        title: Text(
                          "     Saved Contacts",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: 18,
                                    fontFamily: "PlayfairDisplay",
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                    const Divider(),

                    // Saved Locations
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Locations()),
                        );
                      },
                      child: ListTile(
                        leading:
                            const Icon(Icons.location_on, color: Colors.black),
                        title: Text(
                          "     Saved Locations",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: 18,
                                    fontFamily: "PlayfairDisplay",
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                    const Divider(),

                    // Rate/Review Us
                    GestureDetector(
                      onTap: () {},
                      child: ListTile(
                        leading: const Icon(Icons.star, color: Colors.black),
                        title: Text(
                          "     Rate/Review Us",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: 18,
                                    fontFamily: "PlayfairDisplay",
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                    const Divider(),
                    SizedBox(
                      height: 190,
                    ),

                    // Logout
                    GestureDetector(
                      onTap: () {},
                      child: ListTile(
                        leading: const Icon(Icons.logout, color: Colors.red),
                        title: Text(
                          "     Logout",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: 18,
                                    fontFamily: "PlayfairDisplay",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
