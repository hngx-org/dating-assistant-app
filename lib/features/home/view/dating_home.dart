import 'package:dating_assitant_app/features/chat/view/chat.dart';
import 'package:flutter/material.dart';
import 'package:dating_assitant_app/commons/utils/colors.dart';
import 'package:dating_assitant_app/commons/widgets/text_widgets.dart';
import 'package:dating_assitant_app/commons/widgets/custom_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ProjectColors.white,
          title: ListTile(
            leading: Image.asset(
              'assets/logo.png',
              width: 50,
            ),
            title: const Text('Ai Assistant'),
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Textsize32(
              text: 'Welcome to your Ai \ndating assistant',
              color: ProjectColors.pink,
              fontWeight: FontWeight.w800,
              fontSize: 32,
              height: 1.5,
              letterSpacing: 0.5,
            ),
            const SizedBox(
              height: 40,
            ),
            customContainer(
                icon: Icons.quickreply,
                containerTitle: 'Generate quick conversation starters'),
            const SizedBox(
              height: 20,
            ),
            customContainer(
                icon: Icons.message, containerTitle: 'Craft engaging messages'),
            const SizedBox(
              height: 20,
            ),
            customContainer(
                icon: Icons.gesture, containerTitle: 'Get Dating advice'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ProjectColors.pink,
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ChatScreenMain()));
        },
        child: const Icon(
          Icons.chat,
          color: ProjectColors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
