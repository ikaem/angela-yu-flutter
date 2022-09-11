import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/models/message.dart';
import 'package:flash_chat/widgets/sent_message.dart';
import 'package:flutter/material.dart';

class MessagesStreamBuilder extends StatelessWidget {
  final Stream<List<Message>> messagesStream;
  final User? loggedInUser;

  const MessagesStreamBuilder({
    Key? key,
    required this.messagesStream,
    this.loggedInUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Message>>(
      stream: messagesStream,
      builder: (context, snapshot) {
        print("snapshot: $snapshot");

        final status = snapshot.connectionState;
        final data = snapshot.data;
        final error = snapshot.error;

        if (status == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (error != null) {
          return const Center(
            child: Text("There was an error"),
          );
        }

        if (data == null) {
          return const Center(
            child: Text("waiting for data"),
          );
        }

        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            children: <Widget>[
              for (Message message in data)
                SentMessage(
                  text: message.text,
                  sender: message.sender,
                  dateTime: message.dateTime,
                  userEmail: loggedInUser?.email,
                )
            ],
          ),
        );
      },
    );
  }
}
