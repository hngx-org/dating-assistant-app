import 'package:dating_assitant_app/features/chat/widget/chat_messages.dart';
import 'package:dating_assitant_app/global.dart';
import 'package:flutter/material.dart';
import 'package:dating_assitant_app/commons/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hngx_openai/repository/openai_repository.dart';

import 'package:dating_assitant_app/commons/services/storage.dart';

class ChatScreenMain extends StatefulWidget {
  const ChatScreenMain({super.key});

  @override
  State<ChatScreenMain> createState() => _ChatScreenMainState();
}

class _ChatScreenMainState extends State<ChatScreenMain> {
  late bool isLoading;
  final _scrollController = ScrollController();
  final _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];
  final String userCookie =
      Global.storageServices.getUserCookie(); // UserAuth cookies

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _submitMessage() async {
    if (_messageController.text.isNotEmpty) {
      OpenAIRepository openAI = OpenAIRepository();

      //add user messageookie();
      setState(() {
        _messages.add(
          ChatMessage(
            text: _messageController.text,
            chatMessageType: ChatMessageType.user,
          ),
        );

        isLoading = true;
      });

      var userInput = _messageController.text;
      _messageController.clear();

      //initialize ai response
      final aiResponse = await openAI.getChat(userInput, userCookie);

      setState(() {
        _messages.add(
          ChatMessage(text: aiResponse, chatMessageType: ChatMessageType.bot),
        );
        isLoading = false;
      });
      _messageController.clear();
    }
  }

  @override
  void initState() {
    isLoading = false;
    super.initState();
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
        elevation: 0,
      ),
      backgroundColor: ProjectColors.white,
      body: SafeArea(
        child: Column(
          children: [
            //messages area
            Flexible(
              child: ListView.builder(
                  controller: _scrollController,
                  // reverse: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    var message = _messages[index];
                    return ChatMessageWidget(
                      text: message.text,
                      chatMessageType: message.chatMessageType,
                    );
                  }),
            ),

            Visibility(
              visible: isLoading,
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: CircularProgressIndicator(
                  color: ProjectColors.pink,
                ),
              ),
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

class ChatMessageWidget extends StatelessWidget {
  final String text;
  final ChatMessageType chatMessageType;
  const ChatMessageWidget(
      {super.key, required this.text, required this.chatMessageType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      color: chatMessageType == ChatMessageType.user
          ? ProjectColors.grey
          : ProjectColors.pink,
      child: Row(children: [
        chatMessageType == ChatMessageType.user
            ? Container(
                margin: const EdgeInsets.only(right: 16),
                child: const CircleAvatar(
                  child: Icon(Icons.person),
                ),
              )
            : Container(
                margin: const EdgeInsets.only(right: 16),
                child: CircleAvatar(
                  backgroundColor: ProjectColors.white,
                  child: Image.asset(
                    'assets/images/logo.png',
                    scale: 1,
                    color: ProjectColors.white,
                  ),
                ),
              ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: Text(text,
                    style: TextStyle(
                      color: chatMessageType == ChatMessageType.user
                          ? ProjectColors.black
                          : ProjectColors.white,
                    )),
              ),
            ],
          ),
        )
      ]),
    );
  }
}


// color: chatMessageType == ChatMessageType.bot,
// child: Align(
//         alignment: chatMessageType == ChatMessageType.bot
//             ? Alignment.bottomLeft
//             : Alignment.bottomRight,
//         child: Container(


    // ChatMessage _message =
    //     ChatMessage(sender: 'user', text: _messageController.text);
    // setState(() {
    //   _messages.insert(0, _message);
    // });

    // final enteredMessage = _messageController.text;

    // if (enteredMessage.trim().isEmpty) {
    //   return;
    // }

    // send to backend