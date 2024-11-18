import 'package:e_cum_sd_app/user.dart'; // Import your User model
import 'package:firebase_database/firebase_database.dart'; // Firebase Realtime Database

class DatabaseService {
  final _db = FirebaseDatabase.instance.ref(); // Firebase Database instance

  // This method retrieves the user data from the Firebase Realtime Database
  Future<User?> getUser() async {
    try {
      // Reading user data from Firebase (assuming 'USER1/USER DATA' path)
      final snapshot = await _db.child('USER1/USER DATA').get();

      if (snapshot.exists) {
        final data = snapshot.value as Map<dynamic, dynamic>;

        // Mapping the data to a User object
        return User(
            name: data['name'] ?? '',
            age: data['age'] ?? '',
            mobilenumber: data['mobilenumber'] ?? '',
            emailid: data['emailid'] ?? '');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }

    return null; // Return null if data doesn't exist
  }

  // This method creates or updates user data in Firebase
  Future<void> createOrUpdateUser(User user) async {
    try {
      // Writing the user data to Firebase (assuming 'USER1/USER DATA' path)
      await _db.child('USER1/USER DATA').set(user.toMap());
    } catch (e) {
      print('Error saving user data: $e');
    }
  }
}
