// ignore_for_file: use_build_context_synchronously

import 'package:dating_assitant_app/commons/provider/loading_provider.dart';
import 'package:dating_assitant_app/commons/utils/colors.dart';
import 'package:dating_assitant_app/commons/widgets/auth_text_form_field.dart';
import 'package:dating_assitant_app/commons/widgets/button_widget.dart';
import 'package:dating_assitant_app/commons/widgets/circular_progress_indicator.dart';
import 'package:dating_assitant_app/commons/widgets/custom_container.dart';
import 'package:dating_assitant_app/commons/widgets/text_widgets.dart';
import 'package:dating_assitant_app/constants/app_constants.dart';
import 'package:dating_assitant_app/features/application/views/dashbord.dart';
import 'package:dating_assitant_app/features/sign_in/provider/obsure_login_password.dart';
import 'package:dating_assitant_app/features/sign_up/view/sign_up.dart';
import 'package:dating_assitant_app/global.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hng_authentication/authentication.dart';
import 'package:hng_authentication/widgets/widget.dart';


final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class SignIn extends ConsumerWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isObscured = ref.watch(loginpasswordObscure);
    final isSigningIn = ref.watch(loadingProvider);
    final GlobalKey<FormState> _signinformKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(top: 90, right: 20, left: 20, bottom: 20),
            child: isSigningIn ? Center(child: progress()) : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(
                  key: _signinformKey,
                  child: Column(
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
                      AuthTextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains('@')) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        prefixIcon: const Icon(
                          Icons.mail_outline,
                          color: ProjectColors.black,
                          size: 30,
                        ),
                        hintText: 'Email address',
                      ),
                      const SizedBox(height: 20),
                      // Password Textfield
                      AuthTextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          } else if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          return null;
                        },
                        obscureText: isObscured,
                        prefixIcon: IconButton(
                          onPressed: () {
                            ref.read(loginpasswordObscure.notifier).toggle();
                          },
                          icon: isObscured
                              ? const Icon(
                                  Icons.lock,
                                  color: ProjectColors.black,
                                  size: 30,
                                )
                              : const Icon(
                                  Icons.lock_open,
                                  color: ProjectColors.black,
                                  size: 30,
                                ),
                        ),
                        hintText: 'Password',
                      ),
                      const SizedBox(height: 30),

                      // Login Button
                      appButton(
                        onTap: () async {
                          _signinformKey.currentState!.save();
                          if (_signinformKey.currentState!.validate()) {
                            try {
                              ref.read(loadingProvider.notifier).state = true;
                              final email = (_emailController).text;
                              final password = (_passwordController).text;
                              final authRepository = Authentication();
                              final response = await authRepository.signIn(email, password);

                               final setCookieHeader = response.cookie;
                              if (response != null) {
                                // showSnackbar(context, Colors.black, 'SignUp successful');
                                if (kDebugMode) {
                                  print('Cookie: ${response.cookie}');
                                }
                                // This doesn't work... as the header is inaccesible from the response
                                Global.storageServices.setString(AppConstants.localStorageCookie, setCookieHeader);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Dashboard(),
                                  ),
                                );
                              } else {
                                // SignIn failed, display an error message
                                showSnackbar(
                                    context, Colors.red, 'SignIn ERROR');
                              }
                            } catch (error) {
                              // Handle the error and print the error message
                              if (kDebugMode) {
                                print('Error: $error');
                              }
                            } finally {
                              ref.read(loadingProvider.notifier).state = false;
                            }
                          }
                        },
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
                          color: ProjectColors.blue),
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
