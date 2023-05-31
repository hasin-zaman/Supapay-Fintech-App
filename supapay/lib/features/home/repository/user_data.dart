import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supapay/features/home/models/transaction_model.dart';

import '../models/user_model.dart';

final collection = FirebaseFirestore.instance.collection('Users');
final transactionsCollection =
    collection.doc('03110887898').collection('Transactions');

Future<User> fetchUser() async {
  final snapshot = await collection.doc('03110887898').get();
  final userData = User.fromJson(snapshot.data()!);

  return userData;
}

Future<List<TransactionModel>> fetchTransactions() async {
  List<TransactionModel> transactionsList = [];
  final snapshot = await transactionsCollection.limit(5).get();
  for (var queryDocumentSnapshot in snapshot.docs) {
    Map<String, dynamic> data = queryDocumentSnapshot.data();
    data['id'] = queryDocumentSnapshot.id;
    transactionsList.add(TransactionModel.fromJson(data));
  }

  return transactionsList;
}
