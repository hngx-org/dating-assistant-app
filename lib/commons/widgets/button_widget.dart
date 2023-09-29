import 'package:dating_assitant_app/commons/utils/colors.dart';
import 'package:dating_assitant_app/commons/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

// Reusable button 
Widget appButton({
  String buttonTitle = '',
  Color color = ProjectColors.pink,
  double width = double.infinity,
  double height = 61.0,
  BuildContext? context,
  void Function()? onTap
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Center(
        child: ButtonText(
          text: buttonTitle,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}