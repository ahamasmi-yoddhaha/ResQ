import 'dart:developer';

import 'package:e_cum_sd_app/otpscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  final phoneController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("  "),
                    Icon(Icons.arrow_left_sharp, size: 50),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),

                //LOGIN
                const Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 40),
                ),

                const SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Enter Phone Number",
                          suffixIcon: Icon(Icons.phone),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9)))),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () async {
                    FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: phoneController.text,
                        verificationCompleted: (PhoneAuthCredential) {},
                        verificationFailed: (error) {
                          log(error.toString());
                        },
                        codeSent: (verificationId, forceResendingToken) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OtpScreen(
                                        verificationId: verificationId,
                                      )));
                        },
                        codeAutoRetrievalTimeout: (verificationId) {
                          log("Auto Retrieval Timeout");
                        });
                  },
                  child: Text(
                    "VERIFY",
                    style: TextStyle(
                        color: Colors.black, fontFamily: "PlayfairDisplay"),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[400],
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(9))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
