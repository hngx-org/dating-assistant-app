import 'package:dating_assitant_app/commons/utils/colors.dart';
import 'package:dating_assitant_app/commons/widgets/auth_text_form_field.dart';
import 'package:dating_assitant_app/commons/widgets/button_widget.dart';
import 'package:dating_assitant_app/commons/widgets/custom_container.dart';
import 'package:dating_assitant_app/commons/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding:
              const EdgeInsets.only(top: 90, right: 20, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Center(
                    child: Textsize32(
                      text: 'Let\'s Get Started',
                      color: ProjectColors.pink,
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                      height: 1.5,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 60),
                  // Email Textfield
                  const AuthTextFormField(
                    prefixIcon: Icon(
                      Icons.mail_outline,
                      color: ProjectColors.black,
                      size: 30,
                    ),
                    hintText: 'Email address',
                  ),
                  const SizedBox(height: 20),
                  // Password Textfield
                  const AuthTextFormField(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: ProjectColors.black,
                      size: 30,
                    ),
                    hintText: 'Password',
                  ),
                  const SizedBox(height: 30),
                  // Login Button
                  appButton(
                    onTap: () {},
                    buttonTitle: 'Sign up',
                  ),
                  const SizedBox(height: 20),
                  const TextSize18(
                    text: 'Or',
                    color: ProjectColors.black,
                  ),
                  const SizedBox(height: 20),
                  // login with google button
                  customContainer(
                    containerTitle: 'Sign up with Google',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
