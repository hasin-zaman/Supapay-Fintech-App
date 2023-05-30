import 'package:flutter/material.dart';


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
        body: Column(children: const [
          SizedBox(
            height: 20,
          ),
          Card(
            child: ListTile(
              title: Text("Account Number"),
              trailing: Text("03110887898"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            child: ListTile(
              title: Text("IBAN"),
              trailing: Text("XXXXXXXXX"),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ]),
      ),
    );
  }
}
