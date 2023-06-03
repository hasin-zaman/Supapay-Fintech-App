import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supapay/features/customer_support/models/customer_support_chats_model.dart';
import '../../signup/models/user_model.dart';
import '../models/message_model.dart';

class SupportChat extends StatefulWidget {
  const SupportChat({Key? key}) : super(key: key);

  static String? accountNumber;

  @override
  State<SupportChat> createState() => _ChatState();
}

class _ChatState extends State<SupportChat> {

  final messageController=TextEditingController(text: "");

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<MessageModel> messages=[];

  void storeMessage(MessageModel message, String accountNumber) {
    final user = firestore.collection('Users').doc(accountNumber);

    firestore.runTransaction((transaction) async {
      final userSnapshot = await transaction.get(user);

      if (userSnapshot.exists) {
        final chatList = userSnapshot.data()!['chat'] ?? [];

        chatList.add(message.toMap());

        transaction.update(user, {'chat': chatList});
      }
    });
  }


  Future<UserModel?> getUser(String? accountNumber) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('accountNumber', isEqualTo: accountNumber)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final DocumentSnapshot<Map<String, dynamic>> doc = snapshot.docs.first;
        final UserModel user = UserModel.fromMap(doc.data()!);
        return user;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }


  Future<List<MessageModel>> getChat(String? accountNumber) async {
    final user = FirebaseFirestore.instance.collection('Users').doc(accountNumber);

    try {
      final userSnapshot = await user.get();

      if (userSnapshot.exists) {
        final chatList = userSnapshot.data()!['chat'] ?? [];
        final chat = chatList.map<MessageModel>((data) => MessageModel.fromMap(data)).toList();

        return chat;
      } else {
        print("Error");
        return [];
      }
    } catch (e) {
      print('Error retrieving messages: $e');
      return [];
    }
  }

  Future<void> storeChat(CustomerSupportChatsModel chat) async {
    try {
      final CollectionReference chatCollection = FirebaseFirestore.instance.collection('Chats');

      final QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection(''
          'Chats')
          .where('accountNumber', isEqualTo: chat.accountNumber)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        // AccountNumber document exists, rewrite same document
        final DocumentSnapshot<Map<String, dynamic>> doc = snapshot.docs.first;
        await chatCollection.doc(doc.id).set(chat.toMap());
      } else {
        // AccountNumber document does not exist, store a new document
        await chatCollection.add(chat.toMap());
      }

      print('Message stored successfully');
    } catch (e) {
      print('Error storing message: $e');
    }
  }


  Future<void> initializeChat() async {

    if (SupportChat.accountNumber!=null) {
      final fetchedMessages = await getChat(SupportChat.accountNumber);

      setState(() {
        messages = fetchedMessages;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initializeChat();
  }


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFEEF2E6),
        appBar: AppBar(
          backgroundColor: const Color(0xFFEEF2E6),
          scrolledUnderElevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Customer Support'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(child: GroupedListView<MessageModel, DateTime>(
              elements: messages,
              reverse: true,
              order: GroupedListOrder.DESC,
              useStickyGroupSeparators: true,
              floatingHeader: true,
              groupBy: (message) => DateTime(message.date.year, message.date.month, message.date.day),
              groupHeaderBuilder: (MessageModel message) => SizedBox(
                height: 50,
                child: Center(
                  child: Card(
                    color: Color(0xFF1C6758),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      child: Text(
                        DateFormat.yMMMd().format(message.date),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              itemBuilder: (context, MessageModel message) => Align(
                alignment: !message.sentByUser ? Alignment.centerRight : Alignment.centerLeft,
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(message.sentByUser ? 0 : 12),
                        topRight: Radius.circular(message.sentByUser ? 12 : 0),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      )
                  ),
                  color: !message.sentByUser ? Colors.blueGrey : Colors.white70,
                  elevation: 8,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      message.message,
                      style: TextStyle(
                        color: !message.sentByUser ? Colors.white: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              padding: EdgeInsets.all(8),
            ),
            ),
            Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: messageController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                            contentPadding: EdgeInsets.fromLTRB(20, 14, 0, 14),
                            hintText: 'Type your message'
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.fromLTRB(0, 0, 12, 0),
                    child: FloatingActionButton(
                      onPressed: () async {
                        if(messageController.text.length!=0){
                          final UserModel? user=await getUser(SupportChat.accountNumber);

                          final message=MessageModel(
                              message: messageController.text,
                              date: DateTime.now(),
                              sentByUser: user?.role=="Customer" ? false : true);

                          final chat=CustomerSupportChatsModel(
                              name: user!.name,
                              accountNumber: user.accountNumber,
                              profileImageUrl: user.profileImageUrl,
                              visited: true,
                              timestamp: DateTime.now());

                          storeMessage(message, SupportChat.accountNumber!);
                          storeChat(chat);

                          setState(() {
                            messages.add(message);
                            messageController.clear();
                          });
                        }},
                      backgroundColor: Color(0xFF1C6758),
                      child: Icon(Icons.send, color: Colors.white),
                    ),
                  )
                ]
            )
          ],
        ),
      ),
    );
  }
}
