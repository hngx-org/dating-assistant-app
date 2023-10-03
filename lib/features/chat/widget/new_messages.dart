

class Message{
  String messageContent;
  String messageType;
  Message({required this.messageContent, required this.messageType});
}


List<Message> messages = [
    Message(messageContent: "Hello, Will", messageType: "receiver"),
    Message(messageContent: "How have you been?", messageType: "receiver"),
    Message(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender"),
    Message(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    Message(messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];