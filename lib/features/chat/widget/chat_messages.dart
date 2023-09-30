// import 'package:dating_assitant_app/commons/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:dating_assitant_app/features/chat/widget/chat_bubble.dart';
// import 'package:dating_assitant_app/commons/utils/colors.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({super.key, required this.sender, required this.text});

  final String text;
  final String sender;

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [],
    );
  }
}