import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

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
                const ListTile(
                  title: Text("Send us a message"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                )
              ],
            )),
      ),
    ));
  }
}
