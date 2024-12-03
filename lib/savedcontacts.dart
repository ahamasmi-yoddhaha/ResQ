import 'package:e_cum_sd_app/mainspage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedContacts extends StatefulWidget {
  const SavedContacts({super.key});

  @override
  State<SavedContacts> createState() => _SavedContactsState();
}

class _SavedContactsState extends State<SavedContacts> {
  final DatabaseReference contactsRef =
      FirebaseDatabase.instance.ref('USERS/USER1/savedcontacts');

  List<Map<String, dynamic>> contacts = [];
  Map<String, TextEditingController> nameControllers = {};
  Map<String, TextEditingController> phoneControllers = {};

  @override
  void initState() {
    super.initState();
    contactsRef.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>? ?? {};
      setState(() {
        contacts = data.entries.map((e) {
          String id = e.key;
          String name = e.value['name'] ?? '';
          String phone = e.value['phone'] ?? '';

          // Only create controllers once for each contact
          if (!nameControllers.containsKey(id)) {
            nameControllers[id] = TextEditingController(text: name);
            phoneControllers[id] = TextEditingController(text: phone);
          } else {
            nameControllers[id]?.text =
                name; // Update controller text without resetting
            phoneControllers[id]?.text = phone;
          }

          return {
            "id": id,
            "name": name,
            "phone": phone,
          };
        }).toList();
      });
    });
  }

  bool isValidPhoneNumber(String phone) {
    final phoneRegExp = RegExp(r'^\+\d{12}$');
    return phoneRegExp.hasMatch(phone);
  }

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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MainsPage()),
            );
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
                          contactsRef.child(contacts[i]["id"]).remove();
                        },
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      children: [
                        // Name TextField
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
                          controller: nameControllers[contacts[i]["id"]],
                          onChanged: (value) {
                            final id = contacts[i]["id"];
                            // Only update Firebase when the name changes
                            contactsRef.child(id).update({"name": value});
                          },
                        ),
                        const SizedBox(height: 10),
                        // Phone TextField
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
                            phoneNumberFormatter(),
                            LengthLimitingTextInputFormatter(13),
                          ],
                          controller: phoneControllers[contacts[i]["id"]],
                          onChanged: (value) {
                            if (isValidPhoneNumber(value)) {
                              final id = contacts[i]["id"];
                              // Only update Firebase when the phone number changes
                              contactsRef.child(id).update({"phone": value});
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    final newContact = {"name": "", "phone": ""};
                    final newId = "contact${contacts.length + 1}";
                    final newRef = contactsRef.child(newId);
                    newRef.set(newContact);
                  },
                  child: Center(
                    child: Container(
                      child: Center(
                        child: Text(
                          "ADD A CONTACT",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.playfair(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
