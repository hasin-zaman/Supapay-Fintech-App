import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddFundsPage extends StatelessWidget {
  const AddFundsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              trailing: const Text("03110887898"),
              onTap: () {
                Clipboard.setData(const ClipboardData(text: '03110887898'))
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
              trailing: const Text("XXXXXXXXX"),
              onTap: () {
                Clipboard.setData(const ClipboardData(text: 'XXXXXXXXX'))
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
          )
        ]),
      ),
    );
  }
}
