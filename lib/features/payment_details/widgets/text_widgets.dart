import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormLabelText extends StatelessWidget {
  final String label;
  const FormLabelText({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w700),
    );
  }
}
