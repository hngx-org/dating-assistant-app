import 'package:dating_assitant_app/commons/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Optimized TextWidget for the button.
class ButtonText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  const ButtonText({
    super.key,
    this.text = '',
    this.color = ProjectColors.white,
    this.fontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.montserrat(
        fontSize: 24,
        color: color,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
      ),
    );
  }
}

// Text Size 18
class TextSize18 extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  const TextSize18({
    super.key,
    this.text = '',
    this.color = ProjectColors.white,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        fontSize: 18,
        color: color,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        letterSpacing: 0.2
      ),
    );
  }
}

// Text Size 24
class Textsize32 extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double? fontSize;
  final double? height;
  final double? letterSpacing;
  const Textsize32({
    super.key,
    this.text = '',
    this.color = ProjectColors.white,
    this.fontWeight = FontWeight.normal,
    this.fontSize,
    this.height,
    this.letterSpacing,
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
        height: height,
        letterSpacing: letterSpacing,

      ),
    );
  }
}