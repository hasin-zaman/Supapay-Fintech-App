class MessageModel {
  String message;
  DateTime date;
  bool sentByUser;

  MessageModel({
    required this.message,
    required this.date,
    required this.sentByUser,
  });

  // Convert message object to a map for storing in Firebase Firestore
  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'date': date.toIso8601String(),
      'sentByUser': sentByUser,
    };
  }

  // Create a message object from a map retrieved from Firebase Firestore
  static MessageModel fromMap(Map<String, dynamic> map) {
    return MessageModel(
      message: map['message'],
      date: DateTime.parse(map['date']),
      sentByUser: map['sentByUser'],
    );
  }
}
