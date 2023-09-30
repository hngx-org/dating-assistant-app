class Message {
  String text;
  DateTime date;
  bool isSentByMe;

  Message({required this.text, required this.date, required this.isSentByMe});
}

List<Message> messages = [
  Message(
      text: 'Hello',
      date: DateTime.now().subtract(
        const Duration(minutes: 1),
      ),
      isSentByMe: true),
  Message(
      text: 'Hello Sender',
      date: DateTime.now().subtract(
        const Duration(minutes: 1),
      ),
      isSentByMe: false),
].reversed.toList();
