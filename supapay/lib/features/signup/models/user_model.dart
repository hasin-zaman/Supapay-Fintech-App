class UserModel {
  String name;
  String gender;
  DateTime dateOfBirth;
  String email;
  String passcode;
  String profileImageUrl;
  String phone;

  UserModel({
    required this.name,
    required this.gender,
    required this.dateOfBirth,
    required this.email,
    required this.passcode,
    required this.profileImageUrl,
    required this.phone,
  });

  // Convert user object to a map for storing in Firebase Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'email': email,
      'passcode': passcode,
      'profileImageUrl': profileImageUrl,
      'phone': phone,
    };
  }

  // Create a User object from a map retrieved from Firebase Firestore
  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      gender: map['gender'],
      dateOfBirth: map['dateOfBirth'].toDate(),
      email: map['email'],
      passcode: map['passcode'],
      profileImageUrl: map['profileImageUrl'],
      phone: map['phone'],
    );
  }
}
