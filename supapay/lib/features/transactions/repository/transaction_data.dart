import 'package:cloud_firestore/cloud_firestore.dart';

import '../../home/models/transaction_model.dart';

final collection = FirebaseFirestore.instance.collection('Users');
final transactionsCollection =
    collection.doc('03110887898').collection('Transactions');

    Future<List<TransactionModel>> fetchAllTransactions() async {
  List<TransactionModel> transactionsList = [];
  final snapshot = await transactionsCollection.get();
  for (var queryDocumentSnapshot in snapshot.docs) {
    Map<String, dynamic> data = queryDocumentSnapshot.data();
    data['id'] = queryDocumentSnapshot.id;
    transactionsList.add(TransactionModel.fromJson(data));
  }

  return transactionsList;
}