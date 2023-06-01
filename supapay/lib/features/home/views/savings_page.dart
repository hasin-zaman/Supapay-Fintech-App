import 'package:flutter/material.dart';

import '../models/user_model.dart';

class SavingsPage extends StatelessWidget {
  const SavingsPage({super.key, required this.userData});

  final UserModel userData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Column(children: [
                const ListTile(
                  title: Text("Your Income Limit"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: LinearProgressIndicator(
                    value: userData.monthlyIncome! / 20000,
                  ),
                ),
                const ListTile(
                  minVerticalPadding: 0,
                  horizontalTitleGap: 0,
                  visualDensity: VisualDensity.compact,
                  trailing: Text("200000"),
                ),
              ]),
            ),
            Card(
              child: Column(children: [
                const ListTile(
                  title: Text("Your Spending Limit"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: LinearProgressIndicator(
                    value: 10000 / userData.spendingLimit!,
                  ),
                ),
                ListTile(
                  minVerticalPadding: 0,
                  horizontalTitleGap: 0,
                  visualDensity: VisualDensity.compact,
                  trailing: Text('${userData.spendingLimit}'),
                ),
                const ListTile(
                  title: Text("Set Spending Limit"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                )
              ]),
            ),
            Card(
              child: Column(children:  [
                ListTile(
                  title: const Text("Monthly Income"),
                  trailing: Text(userData.monthlyIncome!.toString()),
                ),
                const ListTile(
                  title: Text("Set Income Streams"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                )
              ]),
            ),
            Card(
              child: Column(children: const [
                ListTile(
                  title: Text("Monthly Expense"),
                  trailing: Text("32000"),
                ),
                ListTile(
                  title: Text("Set Expense Streams"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                )
              ]),
            ),
            Card(
              child: Column(children: const [
                ListTile(
                  title: Text("Number of Transactions Per Month"),
                  trailing: Text("10"),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
