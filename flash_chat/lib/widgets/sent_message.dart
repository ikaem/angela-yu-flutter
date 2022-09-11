import 'package:flutter/material.dart';

class SentMessage extends StatelessWidget {
  final String text;
  final String sender;
  final DateTime dateTime;
  final String? userEmail;

  const SentMessage({
    Key? key,
    required this.text,
    required this.sender,
    required this.dateTime,
    required this.userEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isUserMessageOwner = sender == userEmail;
    final formattedDatetime =
        "${dateTime.day}-${dateTime.month}-${dateTime.year} ${dateTime.hour}:${dateTime.minute}:${dateTime.second}";

    return Column(
      crossAxisAlignment: isUserMessageOwner
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end,
      children: [
        Text(sender),
        SizedBox(
          height: 3,
        ),
        Container(
          decoration: BoxDecoration(
            color:
                isUserMessageOwner ? Colors.blueAccent : Colors.yellow.shade900,
            borderRadius: BorderRadius.circular(10).copyWith(
              topLeft: isUserMessageOwner ? Radius.zero : Radius.circular(10),
              topRight: isUserMessageOwner ? Radius.circular(10) : Radius.zero,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              text,
              style: TextStyle(),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          dateTime.toLocal().toString(),
          style: TextStyle(
            color: Colors.grey,
            fontStyle: FontStyle.italic,
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
