import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supapay/features/home/models/transaction_model.dart';

import '../models/user_model.dart';

final collection = FirebaseFirestore.instance.collection('Users');


Future<UserModel> fetchUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? accNumber = prefs.getString('accNumber');
  final snapshot = await collection.doc(accNumber).get();
  final userData = UserModel.fromJson(snapshot.data()!);

  return userData;
}

Future<List<TransactionModel>> fetchTransactions() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? accNumber = prefs.getString('accNumber');
  final transactionsCollection =
    collection.doc(accNumber).collection('Transactions');
  List<TransactionModel> transactionsList = [];
  final snapshot = await transactionsCollection.limit(6).get();
  for (var queryDocumentSnapshot in snapshot.docs) {
    Map<String, dynamic> data = queryDocumentSnapshot.data();
    data['id'] = queryDocumentSnapshot.id;
    transactionsList.add(TransactionModel.fromJson(data));
  }

  return transactionsList;
}
