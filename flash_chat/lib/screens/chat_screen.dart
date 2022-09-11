import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/models/message.dart';
import 'package:flash_chat/router/routes.dart';
import 'package:flash_chat/style/constants.dart';
import 'package:flash_chat/widgets/messages_stream_builder.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _database = FirebaseFirestore.instance;
  final TextEditingController _messageController = TextEditingController();

  User? loggedInUser;
  // String? message;

  Future<void> sendMessage() async {
    final text = _messageController.text;
    final user = loggedInUser;

    if (text.isEmpty) return;
    if (user == null) return;

    final collectionReference = _database.collection("/messages");
    final newMessage = Message(
      text: text,
      sender: user.email!,
      dateTime: DateTime.now(),
    );

    try {
      final response = await collectionReference.add(newMessage.toMap);
      _messageController.clear();
    } catch (e) {
      print("exception: $e");
    }
  }

  Future<List<Message>> getMessages() async {
    final collectionReference = _database.collection("/messages");
    final querySnapshotData = await collectionReference.get();
    final listOfDocumentSnapshots = querySnapshotData.docs;
    final actualDataList = listOfDocumentSnapshots.map((docSnapshot) {
      // return docSnapshot.data();
      final data = docSnapshot.data();
      return Message.fromMap(data);
    }).toList();

    print("actual data list: $actualDataList");

    return actualDataList;
  }

  Stream<List<Message>> getMessagesStream() {
    final collectionReference = _database.collection("/messages");
    final querySnapshotsStream = collectionReference.snapshots();
    //  this above is a stream as it is
    // this below is just for logging

    // query snapshot data is the same one as the above in futures query shasphot data
    // await for (var querySnapshotData in querySnapshotsStream) {
    //   final listOfDocumentSnapshots = querySnapshotData.docs;
    //
    //   final actualDataList = listOfDocumentSnapshots.map((docSnapshot) {
    //     return docSnapshot.data();
    //   }).toList();
    //
    //   print("actual data list in stream: $actualDataList");
    // }

    //todo TEST
    // with map, it seems this event is awaited atuoamtically
    final streamOfMessages = querySnapshotsStream.map((querySnapshotData) {
      final listOfDocumentSnapshots = querySnapshotData.docs;

      // final what = Timestamp(1662865022, 599000000).toDate();
      //
      // final test = DateTime(
      //   Timestamp(seconds = 1662865022, nanoseconds = 599000000),
      // );

      final actualDataList = listOfDocumentSnapshots.map((docSnapshot) {
        final data = docSnapshot.data();
        print(data);
        return Message.fromMap(data);
      }).toList();

      return actualDataList..sort((a, b) => b.dateTime.compareTo(a.dateTime));
    });

    return streamOfMessages;
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      // this should be extending exceptions
      if (user == null) throw Exception("No logged in user");

      loggedInUser = user;
    } catch (e) {
      print("error: $e");
    }
  }

  Future<void> logout() async {
    // note how context is not passed here - it is access ed somewhoe - maybe we can reuse this elswwhere
    final navigator = Navigator.of(context);
    try {
      await _auth.signOut();

      navigator.pushNamedAndRemoveUntil(Routes.welcomeScreen, (route) => false);
    } catch (e) {
      print("error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    // getMessagesStream();
  }

  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () async {
                //Implement logout functionality
                await logout();
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                loggedInUser != null ? loggedInUser!.email! : "Unknown user",
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextButton(
                onPressed: () async {
                  await getMessages();
                },
                child: Text("Helper Button"),
              ),
            ),
            MessagesStreamBuilder(
              messagesStream: getMessagesStream(),
              loggedInUser: loggedInUser,
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      // onChanged: (value) {
                      //   //Do something with the user input.
                      //   message = value;
                      // },
                      controller: _messageController,
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      //Implement send functionality.
                      await sendMessage();
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
