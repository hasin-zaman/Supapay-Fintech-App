class UserModel {
  String name;
  String gender;
  DateTime dateOfBirth;
  String email;
  String passcode;
  String profileImageUrl;
  String phone;
  String accountNumber;
  int balance;
  String cardNumber;
  String cvvCode;
  String expiryDate;
  String iban;
  int monthlyIncome;
  int spendingLimit;

  UserModel({
    required this.name,
    required this.gender,
    required this.dateOfBirth,
    required this.email,
    required this.passcode,
    required this.profileImageUrl,
    required this.phone,
    required this.accountNumber,
    required this.balance,
    required this.cardNumber,
    required this.cvvCode,
    required this.expiryDate,
    required this.iban,
    required this.monthlyIncome,
    required this.spendingLimit
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
      'accountNumber': accountNumber,
      'balance': balance,
      'cardNumber': cardNumber,
      'cvvCode': cvvCode,
      'expiryDate': expiryDate,
      'iban': iban,
      'monthlyIncome': monthlyIncome,
      'spendingLimit': spendingLimit
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
      accountNumber: map['accountNumber'],
      balance: map['balance'],
      cardNumber: map['cardNumber'],
      cvvCode: map['cvvCode'],
      expiryDate: map['expiryDate'],
      iban: map['iban'],
      monthlyIncome: map['monthlyIncome'],
      spendingLimit: map['spendingLimit']
    );
  }
}
