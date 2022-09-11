class Message {
  late String text;
  late String sender;
  late DateTime dateTime;

  Message({
    required this.text,
    required this.sender,
    required this.dateTime,
  });

  Message.fromMap(Map<String, dynamic> data) {
    text = data["text"];
    sender = data["sender"];
    dateTime = data["datetime"].toDate();
  }

  Map<String, dynamic> get toMap => {
        "text": text,
        "sender": sender,
        "datetime": dateTime,
      };
}
