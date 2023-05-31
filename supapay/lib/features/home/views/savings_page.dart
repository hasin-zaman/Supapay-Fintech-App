import 'package:flutter/material.dart';

class SavingsPage extends StatelessWidget {
  const SavingsPage({super.key});

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
              child: Column(children: const [
                ListTile(
                  title: Text("Your Income Limit"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: LinearProgressIndicator(
                    value: 0.4,
                  ),
                ),
                ListTile(
                  minVerticalPadding: 0,
                  horizontalTitleGap: 0,
                  visualDensity: VisualDensity.compact,
                  trailing: Text("200000"),
                ),
              ]),
            ),
            Card(
              child: Column(children: const [
                ListTile(
                  title: Text("Your Spending Limit"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: LinearProgressIndicator(
                    value: 0.6,
                  ),
                ),
                ListTile(
                  minVerticalPadding: 0,
                  horizontalTitleGap: 0,
                  visualDensity: VisualDensity.compact,
                  trailing: Text("25000"),
                ),
                ListTile(
                  title: Text("Set Spending Limit"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                )
              ]),
            ),
            Card(
              child: Column(children: const [
                ListTile(
                  title: Text("Monthly Income"),
                  trailing: Text("32000"),
                ),
                ListTile(
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
