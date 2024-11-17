import 'package:flutter/material.dart';
import 'package:e_cum_sd_app/settings.dart';
import 'package:e_cum_sd_app/homepage.dart';
import 'package:e_cum_sd_app/mylocation.dart';

class MainsPage extends StatefulWidget {
  const MainsPage({super.key});

  @override
  State<MainsPage> createState() => _MainsPageState();
}

class _MainsPageState extends State<MainsPage> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const MyLocation(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              fontFamily: 'CustomFont', // Replace with your font
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        child: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: (index) {
            setState(() => currentIndex = index);
          },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.call), label: "Helpline"),
            NavigationDestination(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
        ),
      ),
    );
  }
}
