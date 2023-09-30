import 'package:dating_assitant_app/features/chat/view/chat.dart';
import 'package:flutter/material.dart';
import 'package:dating_assitant_app/commons/utils/colors.dart';
import 'package:dating_assitant_app/commons/widgets/text_widgets.dart';
import 'package:dating_assitant_app/commons/widgets/custom_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 32.h,
            ),
            Row(children: [
              SizedBox(
                width: 8.w,
              ),
              Image.asset('assets/images/logo.png', width: 50),
              SizedBox(
                width: 12.w,
              ),
              TextSize18(
                text: 'Ai Assistant',
                color: ProjectColors.black,
                fontWeight: FontWeight.normal,
                fontSize: 18.r,
              )
            ]),
            SizedBox(
              height: 40.h,
            ),
            const Textsize32(
              text: 'Welcome to your Ai \ndating assistant',
              color: ProjectColors.pink,
              fontWeight: FontWeight.w800,
              fontSize: 24,
              height: 1.5,
              letterSpacing: 0.5,
            ),
            const SizedBox(
              height: 40,
            ),
            customContainer(
                icon: Icons.quickreply,
                containerTitle: 'Generate quick \nconversation starters'),
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
