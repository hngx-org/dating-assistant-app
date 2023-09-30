import 'package:dating_assitant_app/features/application/widgets/chat_messages.dart';
import 'package:dating_assitant_app/features/application/widgets/new_messages.dart';
import 'package:flutter/material.dart';
import 'package:dating_assitant_app/commons/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreenMain extends StatelessWidget {
  const ChatScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ProjectColors.white,
        title: ListTile(
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
        ),
      ),
      body: const Column(
        children: [
          Expanded(
            child: ChatMessages(),
          ),
          NewMessages()
        ],
      ),
    );
  }
}
