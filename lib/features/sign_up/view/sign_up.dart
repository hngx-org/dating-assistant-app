// ignore_for_file: use_build_context_synchronously
import 'package:dating_assitant_app/commons/provider/loading_provider.dart';
import 'package:dating_assitant_app/commons/utils/colors.dart';
import 'package:dating_assitant_app/commons/widgets/auth_text_form_field.dart';
import 'package:dating_assitant_app/commons/widgets/button_widget.dart';
import 'package:dating_assitant_app/commons/widgets/circular_progress_indicator.dart';
import 'package:dating_assitant_app/commons/widgets/custom_container.dart';
import 'package:dating_assitant_app/commons/widgets/text_widgets.dart';
import 'package:dating_assitant_app/features/sign_up/provider/obscuretext_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hng_authentication/widgets/widget.dart';

import '../../sign_in/view/sign_in.dart';
import 'package:hng_authentication/authentication.dart';

final TextEditingController _usernameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _confirmPasswordController = TextEditingController();

class SignUp extends ConsumerWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isObscure = ref.watch(passwordObscure);
    final isSigningUp = ref.watch(loadingProvider);
    final GlobalKey<FormState> _signupformKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 90, right: 20, left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(
                  key: _signupformKey,
                  child: isSigningUp
                      ? Center(child: progress())
                      : Column(
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
                            // Username Textfield
                            AuthTextFormField(
                              controller: _usernameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a username';
                                }
                                return null;
                              },
                              prefixIcon: const Icon(
                                Icons.person,
                                color: ProjectColors.black,
                                size: 30,
                              ),
                              hintText: 'Username',
                            ),
                            const SizedBox(height: 20),
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
                              suffixIcon: IconButton(
                                onPressed: () {
                                  ref.read(passwordObscure.notifier).toggle();
                                },
                                icon: isObscure
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
                              obscureText: isObscure,
                              hintText: 'Password',
                            ),
                            const SizedBox(height: 20),
                            // Confirm password Textfield
                            AuthTextFormField(
                              controller: _confirmPasswordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a password';
                                } else if (value.length < 8) {
                                  return 'Password must be at least 8 characters';
                                } else if (value != _passwordController.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                              suffixIcon: IconButton(
                                onPressed: () {
                                  ref.read(passwordObscure.notifier).toggle();
                                },
                                icon: isObscure
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
                              obscureText: isObscure,
                              hintText: 'Confirm Password',
                            ),
                            const SizedBox(height: 30),
                            // Login Button
                            appButton(
                              onTap: () async {
                                _signupformKey.currentState!.save();
                                if (_signupformKey.currentState!.validate()) {
                                  try {
                                    ref.read(loadingProvider.notifier).state =
                                        true;
                                    final email = (_emailController).text;
                                    final password = (_passwordController).text;
                                    final name = _usernameController.text;
                                    final authRepository = Authentication();
                                    final data = await authRepository.signUp(
                                        email, name, password);
                                    if (data != null) {
                                      // showSnackbar(context, Colors.black, 'SignUp successful');
                                      if (kDebugMode) {
                                        print(data);
                                      }
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const SignIn(),
                                        ),
                                      );
                                    } else {
                                      // Registration failed, display an error message
                                      showSnackbar(
                                          context, Colors.red, 'SignUp ERROR');
                                    }
                                  } catch (error) {
                                    // Handle the error and print the error message
                                    if (kDebugMode) {
                                      print('Error: $error');
                                    }
                                  } finally {
                                    ref.read(loadingProvider.notifier).state =
                                        false;
                                  }
                                }
                              },
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
