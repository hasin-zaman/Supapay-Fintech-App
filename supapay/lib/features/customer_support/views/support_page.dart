import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  Future<String?> getRole(String? accountNumber) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('accountNumber', isEqualTo: accountNumber)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final DocumentSnapshot<Map<String, dynamic>> doc = snapshot.docs.first;
        final String? role = doc.data()!['role'];
        return role;
      } else {
        return null;
      }
    } catch (e) {
      print('Error retrieving role: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                Row(
                  children: const [
                    Spacer(),
                    Icon(
                      Icons.support_agent_rounded,
                      size: 60,
                    ),
                    Spacer()
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  "How can we help?",
                  style: TextStyle(fontSize: 20),
                ),
                const ListTile(
                  title: Text("FAQs"),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                    final accountNumber=await prefs.getString('accountNumber');
                    final String? role=await getRole(accountNumber);

                    if(role=="Customer"){
                      Navigator.pushNamed(context, '/home/support/chat');
                    }
                  },
                  child: const ListTile(
                    title: Text("Send us a message"),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                    final accountNumber=await prefs.getString('accountNumber');
                    final String? role=await getRole(accountNumber);

                    if(role=="Support"){
                      Navigator.pushNamed(context, '/home/support/chats');
                    }
                  },
                  child: const ListTile(
                    title: Text("Customer Chats"),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                )
              ],
            )),
      ),
    ));
  }
}
