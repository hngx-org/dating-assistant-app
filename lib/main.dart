import 'package:dating_assitant_app/features/sign_in/view/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child:  DatingAssistantApp()));
}

class DatingAssistantApp extends StatelessWidget {
  const DatingAssistantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home:  Dashboard(), // This has to be changed to the splash screen. 
      home: SignIn(),
      debugShowCheckedModeBanner: false,
    );
  }
}
