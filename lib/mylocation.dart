import 'package:flutter/material.dart';
import 'package:e_cum_sd_app/dashboard.dart';

class MyLocation extends StatefulWidget {
  const MyLocation({super.key});

  @override
  State<MyLocation> createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
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
        backgroundColor: Colors.grey[300],
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
        body: Column(
          children: [
            // "MyLocation" text that stays static
            const SizedBox(height: 20),
            const Text(
              'My Location',
              style: TextStyle(
                fontFamily: "PlayfairDisplay",
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 20),
            // SingleChildScrollView for the rest of the content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          width: 360, // Increased width of the container
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Sections: Hospital, Police, Fire Station
                              _buildSection(
                                title: 'HOSPITAL',
                                icon: Icons.local_hospital,
                                iconColor: Colors.red,
                                subtitle: 'City Hospital',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              const Divider(
                                  color: Colors.black38, thickness: 1.0),
                              _buildSection(
                                title: 'POLICE',
                                icon: Icons.local_police_outlined,
                                iconColor: const Color(0xff0f2750),
                                subtitle: 'Local Police',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              const Divider(
                                  color: Colors.black38, thickness: 1.0),
                              _buildSection(
                                title: 'FIRE STATION',
                                icon: Icons.fire_truck,
                                iconColor: const Color(0xffde1738),
                                subtitle: 'Fire Service',
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required Color iconColor,
    required String subtitle,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, size: 40, color: iconColor),
                const SizedBox(width: 20),
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: "PlayfairDisplay",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    // Call functionality
                  },
                  icon: const Icon(Icons.call, color: Color(0xff23a93f)),
                  tooltip: 'Call',
                ),
                IconButton(
                  onPressed: () {
                    // Location functionality
                  },
                  icon: const Icon(Icons.location_on, color: Color(0xff4870b5)),
                  tooltip: 'Location',
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          style: const TextStyle(
            fontFamily: "PlayfairDisplay",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
