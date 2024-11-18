import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';

class SavedContacts extends StatefulWidget {
  const SavedContacts({super.key});

  @override
  State<SavedContacts> createState() => _SavedContactsState();
}

class _SavedContactsState extends State<SavedContacts> {
  // Reference to Firebase Realtime Database
  final DatabaseReference contactsRef =
      FirebaseDatabase.instance.ref('contacts');

  List<Map<String, dynamic>> contacts = [];

  @override
  void initState() {
    super.initState();
    // Listen for changes in Realtime Database
    contactsRef.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>? ?? {};
      setState(() {
        contacts = data.entries.map((e) {
          return {
            "id": e.key,
            "name": e.value['name'] ?? '',
            "phone": e.value['phone'] ?? '',
          };
        }).toList();
      });
    });
  }

  // Validate phone number with country code
  bool isValidPhoneNumber(String phone) {
    final phoneRegExp = RegExp(r'^\+\d{12}$');
    return phoneRegExp.hasMatch(phone);
  }

  // Custom TextInputFormatter for allowing + and numbers
  TextInputFormatter phoneNumberFormatter() {
    return FilteringTextInputFormatter.allow(RegExp(r'[0-9+]'));
  }

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
                      const SizedBox(width: 20),
                      Text(
                        "CONTACT ${i + 1} :",
                        style: const TextStyle(
                            fontSize: 15, fontFamily: "PlayfairDisplay"),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          // Delete contact
                          contactsRef.child(contacts[i]["id"]).remove();
                        },
                      )
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
                            final id = contacts[i]["id"];
                            contactsRef.child(id).update({"name": value});
                          },
                          controller: TextEditingController(
                              text: contacts[i]
                                  ["name"]) // Populate initial value
                            ..selection = TextSelection.fromPosition(
                              TextPosition(offset: contacts[i]["name"].length),
                            ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                              hintText:
                                  "Enter Phone Number (+countryCodePhoneNumber)",
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1.5),
                                borderRadius: BorderRadius.circular(11),
                              ),
                              fillColor: Colors.white,
                              filled: true),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            phoneNumberFormatter(), // Custom formatter
                            LengthLimitingTextInputFormatter(
                                13), // Allow '+' and 12 digits
                          ],
                          onChanged: (value) {
                            if (isValidPhoneNumber(value)) {
                              final id = contacts[i]["id"];
                              contactsRef.child(id).update({"phone": value});
                            } else {
                              // Optionally show an error if the phone number is invalid
                            }
                          },
                          controller: TextEditingController(
                              text: contacts[i]
                                  ["phone"]) // Populate initial value
                            ..selection = TextSelection.fromPosition(
                              TextPosition(offset: contacts[i]["phone"].length),
                            ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
                const SizedBox(height: 40),
                FloatingActionButton(
                  onPressed: () {
                    final newContact = {"name": "", "phone": ""};
                    // Use a custom ID for each contact
                    final newId = "contact${contacts.length + 1}";
                    final newRef = contactsRef.child(newId);
                    newRef.set(newContact);
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
