import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supapay/features/home/models/user_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.userData}) : super(key: key);

  final UserModel userData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: Column(children: [
              const ListTile(),
              const CircleAvatar(
                radius: 30,
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  "${userData.name}",
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const ListTile(),
              ListTile(
                title: const Text("Account Number"),
                trailing: Text('${userData.accountNumber}'),
              ),
              ListTile(
                title: const Text("Email"),
                trailing: Text("${userData.email}"),
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
          Card(
            child: ListTile(
              onTap: () async {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/welcome', (Route<dynamic> route) => false);
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                prefs.clear();
              },
              leading: const Icon(Icons.logout),
              title: const Text("Log Out"),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
            ),
          )
        ],
      ),
    );
  }
}
