import 'package:dating_assitant_app/screens/chat_screen.dart';
import 'package:dating_assitant_app/screens/dating_assitant.dart';
import 'package:dating_assitant_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DatingAssistantApp());
}

class DatingAssistantApp extends StatelessWidget {
  const DatingAssistantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TabBar(
        tabs: [DatingAssistantHome(), ChatScreen(), ProfileScreen()],
      ),
    );
  }
}
