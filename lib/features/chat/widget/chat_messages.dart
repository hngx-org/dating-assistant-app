import 'package:flutter/material.dart';
import 'package:dating_assitant_app/commons/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'How can we help you?',
        style: GoogleFonts.montserrat(
          color: ProjectColors.black,
          fontSize: 18,
        ),
      ),
    );
  }
}
