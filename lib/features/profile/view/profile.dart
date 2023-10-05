import 'package:dating_assitant_app/commons/utils/colors.dart';
import 'package:dating_assitant_app/commons/widgets/custom_container.dart';
import 'package:dating_assitant_app/commons/widgets/text_widgets.dart';
import 'package:dating_assitant_app/features/terms&conditions/view/terms_and_conditions.dart';
import 'package:dating_assitant_app/features/upgrade/view/upgrade.dart';
import 'package:dating_assitant_app/commons/widgets/button_widget.dart';
import 'package:dating_assitant_app/features/sign_in/view/sign_in.dart';
import 'package:flutter/cupertino.dart';
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
              const CircleAvatar(
                radius: 50,
                backgroundColor: ProjectColors.grey,
              ),
              const SizedBox(height: 20),
              const ButtonText(
                text: 'Kolade Oke',
                color: ProjectColors.black,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 60),
              customContainerFilled(
                onTap: () {
                  // Navigate to the upgrade screen.
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Upgrade(),
                  ));
                },
                containerTitle: 'Upgrade to Premium',
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 25),
              customContainer(
                icon: Icons.share,
                containerTitle: 'Share with friends',
              ),
              const SizedBox(height: 25),
              customContainer(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TermsAndConditons(),
                  ));
                },
                icon: CupertinoIcons.doc_text,
                containerTitle: 'Terms and conditions',
              ),
              const SizedBox(height: 25),
              appButton(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignIn()));
                },
                buttonTitle: 'Log out',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
