import 'package:e_cum_sd_app/mainspage.dart';
import 'package:flutter/material.dart';
import 'package:e_cum_sd_app/homepage.dart';
import 'package:e_cum_sd_app/settings.dart';

class SavedLocation extends StatefulWidget {
  const SavedLocation({super.key});

  @override
  State<SavedLocation> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SavedLocation> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'SAVED LOCATIONS',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: "PlayfairDisplay",
                  ),
                ),
                const SizedBox(height: 40),
                Column(
                  children: [
                    // Row for first two location cards (Home & Work)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildLocationTile('MY HOME', "Miyapur"),
                        const SizedBox(width: 20),
                        buildLocationTile('WORK', 'Nizampet'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Row for next two location cards (Add On 1 & Add On 2)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildLocationTile('ADD ON 1', '------'),
                        const SizedBox(width: 20),
                        buildLocationTile('ADD ON 2', '------'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                // Floating Action Button for adding new location
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.grey[400],
                  child: const Icon(Icons.add, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Reusable method to build each location tile
  Widget buildLocationTile(String title, String address) {
    return Container(
      width: 150,
      height: 170,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: "PlayfairDisplay",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Color(0xff1863a1),
                size: 35,
              ),
              const SizedBox(width: 8.0),
              Text(address),
            ],
          ),
        ],
      ),
    );
  }
}
