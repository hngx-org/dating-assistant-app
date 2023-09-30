
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dating_assitant_app/commons/widgets/button_widget.dart';
import 'package:dating_assitant_app/commons/widgets/onboarding_page_indicator_dot.dart';
import 'package:dating_assitant_app/commons/widgets/walk_through_content_widget.dart';
import 'package:dating_assitant_app/constants/images.dart';
import 'package:dating_assitant_app/constants/strings.dart';

class WalkThroughScreen extends StatefulWidget {
  const WalkThroughScreen({super.key});

  @override
  State<WalkThroughScreen> createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  final List<WalkThroughContentBuilder> pages = [
    const WalkThroughContentBuilder(
      imageUrl: AppImages.walkThroughScreenOne,
      leadingTitleText: AppStrings.sayGoodBye,
      preceedingTitleText: AppStrings.awkwardSilence,
      contentText: AppStrings.weWillSuggest,
    ),
    const WalkThroughContentBuilder(
      imageUrl: AppImages.walkThroughScreenTwo,
      leadingTitleText: AppStrings.neverWorryAbout,
      preceedingTitleText: AppStrings.whatToSay,
      contentText: AppStrings.weWillSuggestIceBreakers,
    ),
    const WalkThroughContentBuilder(
      imageUrl: AppImages.walkThroughScreenThree,
      leadingTitleText: AppStrings.letMakeYour,
      preceedingTitleText: AppStrings.datingLifeSmoother,
      contentText: AppStrings.whetherYouAreNew,
    ),
    const WalkThroughContentBuilder(
      imageUrl: AppImages.walkThroughScreenFour,
      leadingTitleText: AppStrings.getExcitedAbout,
      preceedingTitleText: AppStrings.datingAgain,
      contentText: AppStrings.tapGetStarted,
    )
  ];

  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 700.h,
          child: PageView.builder(
            onPageChanged: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
            controller: _pageController,
            itemCount: pages.length,
            itemBuilder: (BuildContext context, int index) => pages[index],
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ...List.generate(
              pages.length,
              (index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.r),
                  child: OnBoardingPageIndicatorDot(
                      isActive: index == _pageIndex)))
        ]),
        const Spacer(),
        Padding(
          padding: EdgeInsets.all(16.r),
          child: appButton(buttonTitle: AppStrings.getStarted),
        ),
      ],
    ));
  }
}
