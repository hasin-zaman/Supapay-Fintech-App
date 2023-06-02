class TransactionModel {
  String? id;
  String? to;
  String? accNumber;
  String? from;
  String? date;
  int? amount;


  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    to = json['to'];
    from = json['from'];
    accNumber = json['accNumber'];
    amount = json['amount'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['to'] = to;
    data['accNumber'] = accNumber;
    data['amount'] = amount;
    data['from'] = from;
    data['date'] = date;
    return data;
  }
}
