class CustomerSupportChatsModel {
  String name;
  String accountNumber;
  String profileImageUrl;
  bool visited;
  DateTime timestamp;

  CustomerSupportChatsModel({
    required this.name,
    required this.accountNumber,
    required this.profileImageUrl,
    required this.visited,
    required this.timestamp,
  });

  // Convert user object to a map for storing in Firebase Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'accountNumber': accountNumber,
      'profileImageUrl': profileImageUrl,
      'visited': visited,
      'timestamp': timestamp,
    };
  }

  // Create a User object from a map retrieved from Firebase Firestore
  static CustomerSupportChatsModel fromMap(Map<String, dynamic> map) {
    return CustomerSupportChatsModel(
        name: map['name'],
        accountNumber: map['accountNumber'],
        profileImageUrl: map['profileImageUrl'],
        visited: map['visited'],
        timestamp: map['timestamp'],
    );
  }
}
