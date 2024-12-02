import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Help> {
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
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 08,
                ),
                const Text(
                  "HELP",
                  style: TextStyle(fontSize: 30, fontFamily: "PlayfairDisplay"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
