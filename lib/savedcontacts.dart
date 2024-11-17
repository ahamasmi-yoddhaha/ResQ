import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SavedContacts extends StatefulWidget {
  const SavedContacts({super.key});

  @override
  State<SavedContacts> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SavedContacts> {
  // List to hold the contacts
  List<Map<String, dynamic>> contacts = [
    {"name": "", "phone": ""}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leading: IconButton(
          icon: const Icon(Icons.arrow_left_sharp, size: 50),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  "SAVED CONTACTS",
                  style: TextStyle(fontSize: 30, fontFamily: "PlayfairDisplay"),
                ),
                const SizedBox(height: 40),
                for (int i = 0; i < contacts.length; i++) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 20),
                      Text(
                        "CONTACT ${i + 1} :",
                        style: TextStyle(
                            fontSize: 15, fontFamily: "PlayfairDisplay"),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                              hintText: "Enter Name",
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1.5),
                                borderRadius: BorderRadius.circular(11),
                              ),
                              fillColor: Colors.white,
                              filled: true),
                          onChanged: (value) {
                            contacts[i]["name"] = value;
                          },
                        ),
                        SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                              hintText: "Enter Phone Number",
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1.5),
                                borderRadius: BorderRadius.circular(11),
                              ),
                              fillColor: Colors.white,
                              filled: true),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          onChanged: (value) {
                            contacts[i]["phone"] = value;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
                SizedBox(height: 40),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      contacts.add({"name": "", "phone": ""});
                    });
                  },
                  backgroundColor: Colors.grey,
                  child: const Icon(Icons.add),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
