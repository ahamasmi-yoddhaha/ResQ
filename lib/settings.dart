import 'package:e_cum_sd_app/dashboard.dart';
import 'package:e_cum_sd_app/help.dart';
import 'package:e_cum_sd_app/permission.dart';
import 'package:e_cum_sd_app/sync.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  void _openDashboard() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Dismiss",
      pageBuilder: (context, animation, secondaryAnimation) {
        return SafeArea(
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1.0, 0.0),
                    end: Offset(-0.07, 0.0), // 3/4th of the screen
                  ).animate(animation),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: const Material(
                      color: Colors.white,
                      child: Dashboard(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'ResQ',
            style: TextStyle(fontSize: 24, fontFamily: "PlayfairDisplay"),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[200],
          leading: IconButton(
            icon: const Icon(Icons.dehaze_rounded),
            onPressed: _openDashboard,
          ),
        ),
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'SETTINGS',
                style: TextStyle(fontSize: 30, fontFamily: "PlayfairDisplay"),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(11),
                ),
                width: 340,
                height: 500,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Permission()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Row(
                          children: [
                            const SizedBox(width: 20), // Space before the text
                            const Text(
                              "Permission Access",
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: "PlayfairDisplay",
                              ),
                            ),
                            const Spacer(),
                            const SizedBox(width: 20), // Space after the arrow
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.black38,
                      thickness: 1.0,
                      indent: 10,
                      endIndent: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Sync()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Row(
                          children: [
                            const SizedBox(width: 20), // Space before the text
                            const Text(
                              "Sync",
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: "PlayfairDisplay",
                              ),
                            ),
                            const Spacer(),
                            const SizedBox(width: 20), // Space after the arrow
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.black38,
                      thickness: 1.0,
                      indent: 10,
                      endIndent: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Help()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Row(
                          children: [
                            const SizedBox(width: 20), // Space before the text
                            const Text(
                              "Privacy Policy",
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: "PlayfairDisplay",
                              ),
                            ),
                            const Spacer(),
                            const SizedBox(width: 20), // Space after the arrow
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.black38,
                      thickness: 1.0,
                      indent: 10,
                      endIndent: 10,
                    ),
                    // RATE/REVIEW without arrow
                    GestureDetector(
                      onTap: () {
                        // Rate/Review functionality
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Row(
                          children: [
                            const SizedBox(width: 20), // Space before the text
                            const Text(
                              "Rate/Review",
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: "PlayfairDisplay",
                              ),
                            ),
                            const Spacer(), // Keep the Spacer to align the text properly
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.black38,
                      thickness: 1.0,
                      indent: 10,
                      endIndent: 10,
                    ),
                    // LOGOUT without arrow
                    GestureDetector(
                      onTap: () {
                        // LogOut functionality
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Row(
                          children: [
                            const SizedBox(width: 20), // Space before the text
                            const Text(
                              "Logout",
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: "PlayfairDisplay",
                              ),
                            ),

                            const Spacer(),
                            // Keep the Spacer to align the text properly
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.black38,
                      thickness: 1.0,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
