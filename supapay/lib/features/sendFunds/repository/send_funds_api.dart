import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supapay/features/home/models/user_model.dart';

final collection = FirebaseFirestore.instance.collection('Users');

Future<String> addTransaction(String accNumber, int amount) async {
  final userAcc = await collection.doc(accNumber).get();

  if (!userAcc.exists) {
    return "User Does Not Exist";
  }
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? userNumber = prefs.getString('accountNumber');
  final userCollection = collection.doc(userNumber);
  final userData = await userCollection.get();

  final user = UserModel.fromJson(userData.data()!);
  final userBal = user.balance!;

  if (amount > userBal) {
    return "Insuffcient Balance";
  }

  userCollection.update({"balance": userBal - amount});
  collection
      .doc(accNumber)
      .update({"balance": userAcc.data()!["balance"] + amount});

  userCollection.collection("Transactions").add({
    "accNumber": accNumber.toString(),
    "amount": -amount,
    "from": user.name,
    "to": userAcc.data()!["name"],
    "date": DateTime.now().toString()
  });

  collection.doc(accNumber).collection("Transactions").add({
    "accNumber": user.accountNumber.toString(),
    "amount": amount,
    "from": user.name,
    "to": userAcc.data()!["name"],
    "date": DateTime.now().toString()
  });

  return "OK";
}
