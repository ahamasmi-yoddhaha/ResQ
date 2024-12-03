import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_left_sharp, size: 50),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                    "PRIVACY POLICY ",
                    style: TextStyle(
                      fontFamily: "PlayfairDisplay",
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Last Updated: [01.12.2024]",
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "1. Introduction",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "Rapid ResQ is committed to protecting the privacy and security of our users. "
                  "This Privacy Policy explains how we collect, use, and safeguard your information "
                  "when you use our emergency assistance app. By using Rapid ResQ, you agree to the practices "
                  "described in this policy.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  "2. Information We Collect",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "To provide effective emergency services, we may collect:\n\n"
                  "• Personal Information: Your name, phone number, email address, and emergency contact details.\n"
                  "• Location Data: Real-time location information to facilitate emergency response.\n"
                  "• Device Information: Device ID, operating system, and app usage data for improving functionality.\n"
                  "• Emergency Logs: Details of emergencies reported through the app.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  "3. How We Use Your Information",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "We use the collected information to:\n\n"
                  "• Provide and enhance emergency services.\n"
                  "• Share your location and contact details with emergency responders or trusted contacts during emergencies.\n"
                  "• Notify your emergency contacts as per your preferences.\n"
                  "• Improve app performance and troubleshoot issues.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  "4. Sharing Your Information",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "We only share your information:\n\n"
                  "• With authorized emergency response teams during active emergencies.\n"
                  "• With your designated emergency contacts upon activation.\n"
                  "• When required by law or to comply with legal obligations.\n\n"
                  "We will never sell or share your information with third parties for marketing purposes.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  "5. Data Security",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "We prioritize the security of your data. Measures include encryption, secure servers, "
                  "and access control to protect your information. However, no system is entirely foolproof, "
                  "and we encourage safe practices to safeguard your information.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  "6. Your Rights",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "You have the right to:\n\n"
                  "• Access and update your personal information.\n"
                  "• Request deletion of your account and associated data.\n"
                  "• Opt-out of non-essential data collection where applicable.\n\n"
                  "To exercise these rights, contact us at [Insert Contact Email].",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  "7. Retention of Information",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "We retain your information only as long as necessary to provide services or comply with legal obligations.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  "8. Third-Party Services",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "Rapid ResQ may integrate with third-party services (e.g., mapping or communication tools). "
                  "We are not responsible for the privacy practices of these providers, so we recommend "
                  "reviewing their policies.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  "9. Updates to This Policy",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "We may update this Privacy Policy from time to time. Changes will be posted within the app, "
                  "and significant changes will be communicated directly to you.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  "10. Contact Us",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "For questions or concerns about this Privacy Policy, contact us at:\n\n"
                  "Email: rapidresQ@gmail.com\n"
                  "Phone: +917207667653\n\n"
                  "Your safety is our priority. Thank you for trusting RapidResQ !!",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
