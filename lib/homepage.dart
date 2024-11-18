import 'package:e_cum_sd_app/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';
import 'package:firebase_database/firebase_database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Telephony telephony = Telephony.instance;
  final DatabaseReference contactsRef =
      FirebaseDatabase.instance.ref('USER1/savedcontacts');
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          title: const Text(
            'ResQ',
            style: TextStyle(fontSize: 24, fontFamily: "PlayfairDisplay"),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.dehaze_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Dashboard()),
              );
            },
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 15),
            GestureDetector(
              onTap: requestSmsPermission,
              child: Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(16.0),
                width: 400,
                height: 150,
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
            SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              height: 380,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: Colors.black,
                  width: 3.0,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    const SizedBox(height: 20),
                    for (int i = 1; i <= 15; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Helpline $i: +123456789',
                          style: const TextStyle(
                              fontSize: 20, fontFamily: "PlayfairDisplay"),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
