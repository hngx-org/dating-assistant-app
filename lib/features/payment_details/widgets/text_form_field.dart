import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dating_assitant_app/commons/utils/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final double? width;
  final String? hintText;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  const CustomTextFormField({
    super.key,
    this.width,
    this.hintText,
    this.controller,
    this.inputFormatters,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: controller,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        cursorColor: ProjectColors.pink,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ProjectColors.pink),
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ProjectColors.pink),
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade900),
            borderRadius: const BorderRadius.all(Radius.circular(0)),
          ),
        ),
      ),
    );
  }
}
