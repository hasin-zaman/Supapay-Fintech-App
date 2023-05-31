import 'package:flutter/material.dart';
import '../../home/models/transaction_model.dart';

Future<dynamic> showTransactionInfo(
    BuildContext context, TransactionModel data) {
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        data.amount.toString(),
                        style: const TextStyle(fontSize: 25),
                      ),
                      const Spacer()
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: const Text("To"),
                    trailing: Text(data.to!),
                  ),
                  ListTile(
                    title: const Text("From"),
                    trailing: Text(data.from!),
                  ),
                  ListTile(
                    title: const Text("Transaction ID"),
                    trailing: Text(data.id!),
                  ),
                  ListTile(
                    title: const Text("Acc Number"),
                    trailing: Text(data.accNumber!),
                  )
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}