import 'package:dating_assitant_app/commons/utils/colors.dart';
import 'package:dating_assitant_app/commons/widgets/custom_container.dart';
import 'package:dating_assitant_app/commons/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ButtonText(text: 'Kolade Oke', color: ProjectColors.black),
              const SizedBox(height: 90),
              customContainerFilled(containerTitle: 'Upgrade to Premium', fontWeight: FontWeight.w600),
              const SizedBox(height: 25),
              customContainer(icon: Icons.share, containerTitle: 'Share with friends')
              
            ],
          ),
        ),
      ),
    );
  }
}
