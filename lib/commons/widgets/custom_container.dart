// Reusable button
import 'package:dating_assitant_app/commons/utils/colors.dart';
import 'package:dating_assitant_app/commons/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

// custom container filled with pink color
Widget customContainerFilled(
    {String containerTitle = '',
    Color color = ProjectColors.pink,
    double width = double.infinity,
    double height = 71.0,
    BuildContext? context,
    FontWeight fontWeight = FontWeight.normal,
    void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: width,
      height: height,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: TextSize18(
        text: containerTitle,
        fontWeight: fontWeight,
      )),
    ),
  );
}

// Normal customContainer
Widget customContainer(
    {String containerTitle = '',
    Color bordercolor = ProjectColors.pink,
    double width = double.infinity,
    double height = 71.0,
    FontWeight fontWeight = FontWeight.normal,
    double fontSize = 18,
    IconData? icon,
    BuildContext? context,
    void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(color: bordercolor),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Row(
        children: [
         if ( icon != null )Icon(icon, size: 33),
          const SizedBox(width: 25),
          TextSize18(
            text: containerTitle,
            color: ProjectColors.black,
            fontWeight: fontWeight,
            fontSize: fontSize,
          )
        ],
      )),
    ),
  );
}
