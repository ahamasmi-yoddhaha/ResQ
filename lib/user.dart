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
