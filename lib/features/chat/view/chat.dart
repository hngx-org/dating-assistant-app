import 'package:dating_assitant_app/features/chat/widget/chat_messages.dart';
import 'package:flutter/material.dart';
import 'package:dating_assitant_app/commons/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dating_assitant_app/features/chat/widget/new_messages.dart';

class ChatScreenMain extends StatefulWidget {
  const ChatScreenMain({super.key});

  @override
  State<ChatScreenMain> createState() => _ChatScreenMainState();
}

class _ChatScreenMainState extends State<ChatScreenMain> {
  final _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _submitMessage() {
    ChatMessage _message =
        ChatMessage(sender: 'user', text: _messageController.text);
    setState(() {
      _messages.insert(0, _message);
    });

    // final enteredMessage = _messageController.text;

    // if (enteredMessage.trim().isEmpty) {
    //   return;
    // }

    // send to backend

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
            color: ProjectColors.black,
          ),
        ),
        title: Text(
          'Ai Assistant',
          style: GoogleFonts.montserrat(
            color: ProjectColors.black,
            fontSize: 18,
          ),
        ),
        backgroundColor: ProjectColors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            //messages area
            Flexible(
              child: ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return Container();
                  }),
            ),

            //input text field
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 1, bottom: 14),
              child: Row(children: [
                Expanded(
                  child: TextField(
                    onSubmitted: (value) => _submitMessage(),
                    controller: _messageController,
                    textCapitalization: TextCapitalization.sentences,
                    autocorrect: true,
                    enableSuggestions: true,
                    decoration: InputDecoration(
                      hintText: 'Start a new message',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                            width: 1, color: ProjectColors.pink),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                            width: 1, color: ProjectColors.pink),
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
            )
          ],
        ),
      ),
    );
  }
}
