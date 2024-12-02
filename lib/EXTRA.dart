import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DatabaseReference dbRef = FirebaseDatabase.instance.ref("contacts");

    return Scaffold(
      appBar: AppBar(title: Text("Contacts")),
      body: StreamBuilder(
        stream: dbRef.onValue,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data?.snapshot.value == null) {
            return Center(child: CircularProgressIndicator());
          }

          final Map<dynamic, dynamic> contacts =
              snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
          final contactList = contacts.entries.map((e) => e.value).toList();

          return ListView.builder(
            itemCount: contactList.length,
            itemBuilder: (context, index) {
              final contact = contactList[index];
              return ListTile(
                title: Text(contact['name']),
                subtitle: Text(contact['phone']),
                trailing: Icon(Icons.phone, color: Colors.green),
                onTap: () async {
                  final Uri launchUri = Uri(
                    scheme: 'tel',
                    path: contact['phone'],
                  );
                  if (await canLaunchUrl(launchUri)) {
                    await launchUrl(launchUri);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text('Could not launch ${contact['phone']}')),
                    );
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
