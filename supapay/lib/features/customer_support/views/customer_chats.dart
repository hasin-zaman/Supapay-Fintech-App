import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:supapay/features/customer_support/views/support_chat.dart';

class CustomerChats extends StatelessWidget {
  const CustomerChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1C6758),
          title: Text(
            'Customer Chats',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          scrolledUnderElevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xFF1C6758),
                    Color(0xFF26806E),
                    Color(0xFF279C84),
                  ],
                  begin: Alignment.topRight
              )
          ),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Chats')
                .orderBy('timestamp', descending: true)
                .snapshots(),
            builder: (BuildContext context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.all(12),
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot? chats = snapshot.data?.docs[index];
                  String name=chats?['name'];
                  String accountNumber=chats?['accountNumber'];
                  bool visited=chats?['visited'];
                  String profileImageUrl=chats?['profileImageUrl'];

                  return GestureDetector(
                    onTap: () {
                      SupportChat.accountNumber=accountNumber;
                      Navigator.pushNamed(context, '/home/support/support-chat');
                    },
                    child: Card(
                      elevation: 7,
                      color: Colors.grey,
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        leading: CircleAvatar(
                            backgroundImage: AssetImage('assets/user_default.png'),
                            backgroundColor: Color(0xFFCFCFCF)),
                        title: Text(
                            name,
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: Text(
                            accountNumber,
                          style: TextStyle(color: Colors.black54),
                        ),
                        trailing: Icon(
                            Icons.notification_important,
                            color: visited ? Colors.black45 : Colors.red[700],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
