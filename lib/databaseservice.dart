import 'package:firebase_database/firebase_database.dart'; // Firebase Realtime Database

class DatabaseService {
  final _db = FirebaseDatabase.instance.ref(); // Firebase Database instance

  // This method retrieves the user data from the Firebase Realtime Database
  Future<User?> getUser() async {
    try {
      // Reading user data from Firebase (assuming 'USER1/USER DATA' path)
      final snapshot = await _db.child('USERS/USER1/USER DATA').get();

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
      await _db.child('USERS/USER1/USER DATA').set(user.toMap());
    } catch (e) {
      print('Error saving user data: $e');
    }
  }
}

class User {
  final String name;
  final String age;
  final String mobilenumber;
  final String emailid;

  User({
    required this.name,
    required this.age,
    required this.mobilenumber,
    required this.emailid,
  });

  // Convert User object to Map (for easy storage)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'mobilenumber': mobilenumber,
      'emailid': emailid,
    };
  }

  // Create a User object from a Map (for easy retrieval)
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      age: map['age'],
      mobilenumber: map['mobilenumber'],
      emailid: map['emailid'],
    );
  }
}
