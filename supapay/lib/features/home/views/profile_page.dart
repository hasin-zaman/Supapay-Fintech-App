import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: Column(children: const [
              ListTile(),
              CircleAvatar(
                radius: 30,
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  "UserName",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(),
              ListTile(
                title: Text("Account Number"),
                trailing: Text("Number"),
              ),
              ListTile(
                title: Text("Email"),
                trailing: Text("Email"),
              ),
            ]),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.contact_support),
              title: const Text("Customer Support"),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                Navigator.pushNamed(context, '/home/support');
              },
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log Out"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          )
        ],
      ),
    );
  }
}
