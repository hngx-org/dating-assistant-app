import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:dating_assitant_app/constants/app_colors.dart';

class WalkThroughContentBuilder extends StatelessWidget {
  final String imageUrl;
  final String leadingTitleText;
  final String preceedingTitleText;
  final String contentText;

  const WalkThroughContentBuilder(
      {super.key,
      required this.imageUrl,
      required this.leadingTitleText,
      required this.preceedingTitleText,
      required this.contentText});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Image.asset(imageUrl, height: 420.h),
          Text(leadingTitleText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 24.r,
                  fontWeight: FontWeight.bold)),
          Text(preceedingTitleText,
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 24.r,
                  fontWeight: FontWeight.bold)),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 45.r, vertical: 16.h),
              child: Text(
                contentText,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.greyColor, fontSize: 14.r, height: 1.7.r),
              ))
        ]));
  }
}
