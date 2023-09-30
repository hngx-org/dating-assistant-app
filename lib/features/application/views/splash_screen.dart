import 'package:dating_assitant_app/constants/images.dart';
import 'package:dating_assitant_app/features/application/views/walk_through_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const WalkThroughScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(16.r),
            child: Center(
              child: Image.asset(
                AppImages.logoImage,
                height: 150.r,
                width: 150.r,
              ),
            )));
  }
}
