import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:dating_assitant_app/constants/app_colors.dart';

class OnBoardingPageIndicatorDot extends StatelessWidget {
  final bool isActive;

  const OnBoardingPageIndicatorDot({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isActive ? 10.r : 6.r,
      width: isActive ? 10.r : 6.r,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: isActive ? AppColors.skyeBlueColor : AppColors.greyColor),
    );
  }
}
