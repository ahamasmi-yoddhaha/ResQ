import 'package:e_cum_sd_app/mainspage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Locations extends StatefulWidget {
  const Locations({super.key});

  @override
  State<Locations> createState() => _LocationsState();
}

final databaseReference =
    FirebaseDatabase.instance.ref().child("USERS/USER1/my locations");

class _LocationsState extends State<Locations> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Text(
            'SAVED LOCATIONS',
            style: TextStyle(
              fontSize: 30,
              fontFamily: "PlayfairDisplay",
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: FirebaseAnimatedList(
              query: databaseReference,
              itemBuilder: (context, snapshot, animation, index) {
                String title = snapshot.child('title').value.toString();
                String address = snapshot.child('address').value.toString();

                return Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width *
                          0.8, // 90% of screen width
                      height: 100, // Adjust height
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10), // Side margin
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: "PlayfairDisplay",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                              height: 20), // Space between title and address
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.blue,
                                size: 35,
                              ),
                              const SizedBox(width: 8.0),
                              Text(
                                address,
                                style: GoogleFonts.raleway(fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20), // Space between containers
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                SizedBox(
                  width: 95,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[400],
                  ),
                  child: GestureDetector(
                    child: Center(
                      // Ensures the text is centered inside the container
                      child: Text(
                        "ADD A LOCATION",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.playfair(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    onTap: () {
                      titleController.clear();
                      addressController.clear();
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return myDialogBox(
                                context: context,
                                title: "Add a new Location",
                                address: "Save",
                                onPressed: () {
                                  final id = DateTime.now()
                                      .millisecondsSinceEpoch
                                      .toString();
                                  databaseReference.child(id).set({
                                    'title': titleController.text.toString(),
                                    'address':
                                        addressController.text.toString(),
                                  });
                                  Navigator.pop(context);
                                });
                          });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    ));
  }

  Dialog myDialogBox({
    required BuildContext context,
    required String title,
    required String address,
    required VoidCallback onPressed,
  }) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(11)),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                CircleAvatar(
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                      )),
                )
              ],
            ),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Enter the place"),
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(labelText: "Enter the address"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: onPressed, child: Text(address)),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
