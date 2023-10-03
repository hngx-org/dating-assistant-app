import 'package:dating_assitant_app/commons/utils/colors.dart';
import 'package:dating_assitant_app/commons/widgets/auth_text_form_field.dart';
import 'package:dating_assitant_app/commons/widgets/button_widget.dart';
import 'package:dating_assitant_app/commons/widgets/custom_container.dart';
import 'package:dating_assitant_app/commons/widgets/text_widgets.dart';
import 'package:dating_assitant_app/features/application/views/dashbord.dart';
import 'package:dating_assitant_app/features/sign_up/view/sign_up.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(top: 90, right: 20, left: 20, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Center(
                      child: Textsize32(
                        text: 'Hello Again',
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
                      buttonTitle: 'Log in',
                    ),
                    const SizedBox(height: 20),
                    const TextSize18(
                      text: 'Or',
                      color: ProjectColors.black,
                    ),

                    const SizedBox(height: 20),
                    // login with google button
                    customContainer(
                      containerTitle: 'Log in with Google',
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    )
                  ],
                ),
           

              // don't have an account section
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      // Navigate to the sign up screen
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUp(),
                      ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TextSize18(
                          text: 'Don\'t have an account?',
                          color: ProjectColors.black,
                        ),
                        const SizedBox(width: 7),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUp(),
                            ));
                          },
                          child: const TextSize18(
                            text: 'Sign up',
                            color: ProjectColors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to the home page
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Dashboard(),
                      ));
                    },
                    child: const TextSize18(
                      text: 'Start without creating an account',
                      color: ProjectColors.blue
                      
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
