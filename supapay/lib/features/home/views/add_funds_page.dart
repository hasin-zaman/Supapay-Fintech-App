import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/user_model.dart';

class AddFundsPage extends StatelessWidget {
  const AddFundsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userData = ModalRoute.of(context)?.settings.arguments as User;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Funds"),
          centerTitle: true,
        ),
        body: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Card(
            child: ListTile(
              title: const Text("Account Number"),
              trailing: Text(userData.accountNumber!),
              onTap: () {
                Clipboard.setData(ClipboardData(text: userData.accountNumber!))
                    .then((_) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      content: Row(
                        children: const [
                          Icon(Icons.check),
                          Text("Copied to clipboard"),
                        ],
                      )));
                });
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Card(
            child: ListTile(
              title: const Text("IBAN"),
              trailing: Text(userData.iban!),
              onTap: () {
                Clipboard.setData(ClipboardData(text: userData.iban)).then((_) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      content: Row(
                        children: const [
                          Icon(Icons.check),
                          Text("Copied to clipboard"),
                        ],
                      )));
                });
              },
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ]),
      ),
    );
  }
}
