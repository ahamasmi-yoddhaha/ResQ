import 'dart:developer';

import 'package:e_cum_sd_app/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.verificationId});
  final String verificationId;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  final otpController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP SCREEN"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: otpController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  hintText: "Enter The OTP",
                  suffixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9))),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
              onPressed: () async {
                try {
                  final cred = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: otpController.text);
                  await FirebaseAuth.instance.signInWithCredential(cred);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                } catch (e) {
                  log(e.toString());
                }
              },
              child: Text("OTP"))
        ],
      ),
    );
  }
}
