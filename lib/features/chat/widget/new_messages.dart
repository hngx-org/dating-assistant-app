import 'package:flutter/material.dart';
import 'package:dating_assitant_app/commons/utils/colors.dart';

class NewMessages extends StatefulWidget {
  const NewMessages({super.key});

  @override
  State<NewMessages> createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _submitMessage() {
    final enteredMessage = _messageController.text;

    if (enteredMessage.trim().isEmpty) {
      return;
    }

    // send to backend

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 1, bottom: 14),
      child: Row(children: [
        Expanded(
          child: TextField(
            controller: _messageController,
            textCapitalization: TextCapitalization.sentences,
            autocorrect: true,
            enableSuggestions: true,
            decoration: InputDecoration(
              hintText: 'Start a new message',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide:
                    const BorderSide(width: 1, color: ProjectColors.pink),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide:
                    const BorderSide(width: 1, color: ProjectColors.pink),
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: _submitMessage,
          style: ElevatedButton.styleFrom(
            backgroundColor: ProjectColors.pink,
            shape: const CircleBorder(), //<-- SEE HERE
            padding: const EdgeInsets.all(20),
          ),
          child: const Icon(
            //<-- SEE HERE
            Icons.send,
            color: ProjectColors.white,
            size: 20,
          ),
        ),
      ]),
    );
  }
}
