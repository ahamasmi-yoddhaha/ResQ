import 'dart:developer';

import 'package:e_cum_sd_app/mainspage.dart';
import 'package:e_cum_sd_app/mappage.dart';
import 'package:e_cum_sd_app/updateprofile.dart';
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
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),

              //OTP
              const Text(
                "OTP",
                style: TextStyle(fontSize: 40, fontFamily: "PlayfairDisplay"),
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: otpController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9))),
                ),
              ),
              SizedBox(height: 40),
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
                          builder: (context) => const UpdateProfile(),
                        ));
                  } catch (e) {
                    log(e.toString());
                  }
                },
                child: Text(
                  "SIGN IN",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "PlayfairDisplay",
                      fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(150, 50),
                    backgroundColor: Colors.grey[400],
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(9))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
