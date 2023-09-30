import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/application/views/splash_screen.dart';

void main() {
  runApp(const ProviderScope(child: DatingAssistantApp()));
}

class DatingAssistantApp extends StatelessWidget {
  const DatingAssistantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(370, 810),
        minTextAdapt: false,
        splitScreenMode: true,
        builder: (context, child) {
          return const MaterialApp(
            home: SplashScreen(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
