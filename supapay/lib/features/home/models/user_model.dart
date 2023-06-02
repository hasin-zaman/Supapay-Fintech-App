class UserModel {
  String? name;
  String? email;
  String? accountNumber;
  String? iban;
  String? cvvCode;
  String? cardNumber;
  String? expiryDate;
  int? spendingLimit;
  int? monthlyIncome;
  int? balance;

  UserModel(
      {this.name,
      this.email,
      this.accountNumber,
      this.cardNumber,
      this.expiryDate,
      this.balance,
      this.cvvCode});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    accountNumber = json['accountNumber'];
    balance = json['balance'];
    iban = json['iban'];
    cvvCode = json['cvvCode'];
    cardNumber = json['cardNumber'];
    expiryDate = json['expiryDate'];
    spendingLimit = json['spendingLimit'];
    monthlyIncome = json['monthlyIncome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['id'] = accountNumber;
    return data;
  }
}
