import 'package:flutter/material.dart';
import 'package:supapay/features/home/components/bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.transactions,
    required this.onRefresh,
  }) : super(key: key);

  final List<int> transactions;
  final Function onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return onRefresh();
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.person)),
                    title: const Text("Owais"),
                    trailing: Image.network(
                        'https://static.vecteezy.com/system/resources/previews/022/100/815/non_2x/master-card-logo-transparent-free-png.png'),
                    subtitle: const Text("Hello There!"),
                  ),
                  const ListTile(
                    title: Text("Total Balance:"),
                    trailing: Text(
                      "Rs. 32100",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              iconSize: 35,
                              icon: const Icon(Icons.send),
                              onPressed: () {},
                            ),
                            const Text("Send Funds"),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              iconSize: 35,
                              icon: const Icon(Icons.monetization_on),
                              onPressed: () {
                                Navigator.pushNamed(context, '/home/addFunds');
                              },
                            ),
                            const Text("Add Funds"),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              iconSize: 35,
                              icon: const Icon(Icons.more_horiz_outlined),
                              onPressed: () {
                                bottomSheetMore(context);
                              },
                            ),
                            const Text("More")
                          ],
                        )
                      ]),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
              child: Text(
                "Recent Transactions",
                style: TextStyle(fontSize: 25),
              ),
            ),
            for (var _ in transactions)
              Card(
                  child: ListTile(
                leading: const Icon(
                  Icons.arrow_circle_right_rounded,
                  color: Colors.green,
                ),
                title: const Text("Name"),
                subtitle: const Text("Date"),
                trailing: const Text("Amount"),
                onTap: () {
                  showTransactionInfo(context);
                },
              )),
            Card(
              child: ListTile(
                title: const Text("See More"),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {
                  Navigator.pushNamed(context, '/home/transactions');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
