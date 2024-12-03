import 'package:e_cum_sd_app/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Telephony telephony = Telephony.instance;
  final List<String> phoneNumbers = [
    "102",
    "100",
    "108",
    "1070",
    "040 - 23202113",
    "101",
    "1098",
    "1077",
    "1091"
  ];
  final List<String> helplines = [
    'Ambulance',
    'Police Control Room',
    'Accident Helpline',
    'State Control Room',
    'Collectorate',
    'Fire and rescue',
    'Child helpline',
    'Disaster Helpline',
    'Sexual Harrasment',
  ];
  final DatabaseReference contactsRef =
      FirebaseDatabase.instance.ref('USERS/USER1/savedcontacts');
  List<Map<String, dynamic>> contacts = [];

  @override
  void initState() {
    super.initState();
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

  Future<void> _makeCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunch(phoneUri.toString())) {
      await launch(phoneUri.toString());
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  void requestSmsPermission() async {
    bool? permissionsGranted = await telephony.requestSmsPermissions;
    if (permissionsGranted == true) {
      _showConfirmationDialog();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("SMS permissions denied.")),
      );
    }
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Send Emergency Message'),
          content: const Text(
              'Do you really want to send the emergency message to your contacts?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("Your request has been cancelled")),
                );
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                sendEmergencyMessages();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void sendEmergencyMessages() async {
    // Ensure contacts are loaded before sending messages
    if (contacts.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No contacts found")),
      );
      return;
    }

    for (var contact in contacts) {
      String phone = contact['phone'];
      if (phone.isNotEmpty && phone.startsWith('+') && phone.length == 13) {
        try {
          await telephony.sendSms(
            to: phone,
            message: "Help! I am in an emergency, please assist.",
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Emergency message sent to $phone")),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text("Failed to send message to $phone. Error: $e")),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Invalid phone number: $phone")),
        );
      }
    }
  }

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
                          end: Offset(-0.07, 0.0))
                      .animate(animation),
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
          backgroundColor: Colors.grey[100],
          title: const Text(
            'ResQ',
            style: TextStyle(fontSize: 24, fontFamily: "PlayfairDisplay"),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.dehaze_rounded),
            onPressed: _openDashboard,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: requestSmsPermission,
              child: Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(16.0),
                width: 400,
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.red.shade900,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Colors.red,
                    width: 3.0,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'EMERGENCY',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontFamily: "PlayfairDisplay"),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              height: 360,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'COMMON HELPLINE NUMBERS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "PlayfairDisplay",
                      color: Colors.black,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Divider(color: Colors.black),
                  Expanded(
                    child: ListView.builder(
                      itemCount: phoneNumbers.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            _makeCall(phoneNumbers[index]);
                          },
                          child: ListTile(
                            title: Row(
                              children: [
                                Text(
                                  helplines[index],
                                  style: GoogleFonts.raleway(),
                                ),
                                Text(" : "),
                                Text(
                                  phoneNumbers[index],
                                  style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
