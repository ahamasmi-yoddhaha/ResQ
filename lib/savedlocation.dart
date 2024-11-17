import 'package:flutter/material.dart';

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
      child: SafeArea(
        child: Scaffold(
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
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'SAVED LOCATIONS',
                    style:
                        TextStyle(fontSize: 30, fontFamily: "PlayfairDisplay"),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 170,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'MY HOME',
                                  style: TextStyle(
                                    fontFamily: "PlayfairDisplay",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 40),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.black,
                                      size: 35,
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Text('---------'),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            width: 150,
                            height: 170,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'WORK',
                                  style: TextStyle(
                                    fontFamily: "PlayfairDisplay",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 40),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.black,
                                      size: 35,
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Text('---------'),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 170,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'ADD ON 1',
                                  style: TextStyle(
                                    fontFamily: "PlayfairDisplay",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 40),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.black,
                                      size: 35,
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Text('---------'),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 150,
                            height: 170,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'ADD ON 2',
                                  style: TextStyle(
                                    fontFamily: "PlayfairDisplay",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 40),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.black,
                                      size: 35,
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Text('---------'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.grey[400],
                    child: const Icon(Icons.add, color: Colors.black),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
