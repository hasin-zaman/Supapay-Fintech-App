import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home/models/transaction_model.dart';

final collection = FirebaseFirestore.instance.collection('Users');

Future<List<TransactionModel>> fetchAllTransactions() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? accNumber = prefs.getString('accountNumber');
  final transactionsCollection =
      collection.doc(accNumber).collection('Transactions').orderBy('date', descending: true);
  List<TransactionModel> transactionsList = [];
  final snapshot = await transactionsCollection.get();
  for (var queryDocumentSnapshot in snapshot.docs) {
    Map<String, dynamic> data = queryDocumentSnapshot.data();
    data['id'] = queryDocumentSnapshot.id;
    transactionsList.add(TransactionModel.fromJson(data));
  }

  return transactionsList;
}
