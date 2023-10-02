import 'package:flutter/material.dart';

import 'package:dating_assitant_app/commons/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ConditionText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  const ConditionText({
    super.key,
    this.text = '',
    this.color = ProjectColors.black,
    this.fontWeight = FontWeight.w400,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        letterSpacing: 0.8,
        height: 1.3,
      ),
    );
  }
}
