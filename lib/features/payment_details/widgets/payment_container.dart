import 'package:dating_assitant_app/commons/utils/colors.dart';
import 'package:flutter/material.dart';

class PaymentContainer extends StatelessWidget {
  final String imageURL;
  final double? height;
  final double? width;

  const PaymentContainer({
    super.key,
    required this.imageURL,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
      decoration: BoxDecoration(
        color: ProjectColors.white,
        borderRadius: BorderRadius.circular(2),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(71, 158, 158, 158),
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Image.asset(imageURL, height: height, width: width),
    );
  }
}
